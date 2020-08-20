class UsersController < ApplicationController
  def index
     @user = current_user
     @users = User.all.page(params[:page]).per(6)
  end
  def show
     @user = User.find(params[:id]) 
     @plans = @user.plans
  end
  def update
    @user = current_user
    #画像が編集された時
    #パラメーター(画像)を「tempfile」として開いて変数に代入
    #image = File.open(params[:user][:image])
    # Cloud Vision APIで画像分析して、分析結果を変数に代入
    result = Vision.get_image_data(params[:user][:image]) unless params[:user][:image].is_a?(String)
    # 解析結果によって条件分岐
    if result.nil? || result.values.include?('VERY_LIKELY')
    # exclude adult very likely
    # if result.nil? || result["adult"] == 'VERY_LIKELY' || result["vaolence"] == 'VERY_LIKELY'
      render "edit"
    else
      @user.update(user_params)
      return redirect_to user_path(current_user.id), notice: "successfully updated user!"
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
