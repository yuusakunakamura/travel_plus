# frozen_string_literal: true

class PlansController < ApplicationController
  before_action :baria_user, only: %i[edit update destroy]
  def new
    @plan = Plan.new
    @plan.plan_dates.build
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id

    unless params[:plan][:plan_dates_attributes]['0'][:image].is_a?(String)
      result = Vision.get_image_data(params[:plan][:plan_dates_attributes]['0'][:image])
    end

    # 画像解析
    if result.nil? || result.values.exclude?('VERY_LIKELY')
      if @plan.save
        redirect_to plan_path(@plan)
      else
        render new_plan_path(@plan), notice: '全ての項目を記入して下さい'
      end
    else
      render new_plan_path(@plan), notice: '全ての項目を記入して下さい'
    end
  end

  def show
    @plan = Plan.find(params[:id])
    @user = @plan.user
    @like = Like.new
    @comment = Comment.new
    @comments = @plan.comments
  end

  def index
    @plans = Plan.all.page(params[:page]).per(2)
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
     unless params[:plan][:plan_dates_attributes]['0'][:image].is_a?(String)
      result = Vision.get_image_data(params[:plan][:plan_dates_attributes]['0'][:image])
    end
    if result.nil? || result.values.exclude?('VERY_LIKELY')
     if @plan.update(plan_params)
      redirect_to plan_path(@plan)
     else
      render 'edit'
     end
    else
      render 'edit'
    end
  end

  def destroy
    @plan = Plan.find(params[:id]) # データ(レコード)を1件取得
    @plan.destroy # データ（レコード）を削除
    redirect_to user_path(@plan.user) # List一覧画面へリダイレクト
  end

  private

  def plan_params
    params.require(:plan).permit(:oversea,:word, :title, :user_id, :picture, :introduction, :date, plan_dates_attributes: %i[_destroy id image price place_name place_introduction time])
  end
  def baria_user
    redirect_to plans_path(@plan) unless Plan.find(params[:id]).user.id.to_i == current_user.id
  end

end
