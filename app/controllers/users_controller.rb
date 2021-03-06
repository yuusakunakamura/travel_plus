# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all.page(params[:page]).per(2)
  end

  def show
    @user = User.find(params[:id])
    @plans = @user.plans.page(params[:page]).per(2)
  end

  def update
    @user = current_user
    # 画像が編集された時
    # パラメーター(画像)を「tempfile」として開いて変数に代入
    # image = File.open(params[:user][:image])
    # Cloud Vision APIで画像分析して、分析結果を変数に代入
    result = Vision.get_image_data(params[:user][:image]) unless params[:user][:image].is_a?(String)
    # 解析結果によって条件分岐
    if result.nil? || result.values.exclude?('VERY_LIKELY')
      # exclude adult very likely
      # if result.nil? || result["adult"] == 'VERY_LIKELY' || result["vaolence"] == 'VERY_LIKELY'
      @user.update(user_params)
      redirect_to user_path(current_user.id), notice: 'successfully updated user!'
    else
      render 'edit'
    end
  end

  def edit
    @user = current_user
  end

  def hide
    @user = current_user
    @user.update(is_withdrawal: true)
    reset_session
    flash[:notice] = 'ありがとうございました。またのご利用を心よりお待ちしております。'
    redirect_to root_path
  end

  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%").page(params[:page]).per(2)
    else
      @users = User.all.page(params[:page]).per(2)
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :is_withdrawal, :image, :name)
  end
end
