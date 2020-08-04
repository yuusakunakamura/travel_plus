class UsersController < ApplicationController
  def index
  end
  def show
  end
  def withdrawal
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
    params.require(:user).permit(:is_withdrawal)
  end
end
