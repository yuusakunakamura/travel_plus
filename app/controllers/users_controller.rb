class UsersController < ApplicationController
  def index
     @user = current_user
     @users = User.all
  end
  def show
     @user = current_user
     @plans = @user.plans
  end
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
    redirect_to user_path(current_user.id), notice: "successfully updated user!"
    else
        render "edit"
    end
  end
  def edit
     @user = current_user
  end
  

  def hide
    @user = current_user
    @user.update(is_withdrawal: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  private
  def user_params
    params.require(:user).permit(:email,:is_withdrawal,:image,:name)
  end
end
