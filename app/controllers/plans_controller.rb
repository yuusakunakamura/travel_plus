class PlansController < ApplicationController
  before_action :baria_user, only: [:edit, :update, :destroy]
  def new
  @plan = Plan.new 
  @plan.plan_dates.build
  end

  def create
  @plan = Plan.new(plan_params)
  @plan.user_id = current_user.id
   if @plan.save
           redirect_to plan_path(@plan)
          else
            @plans = Plan.all
            render 'index'
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
  @plans = Plan.all

  end

  

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
  	@plan = Plan.find(params[:id])
  	@plan.update(plan_params)
  	redirect_to plan_path(@plan)
  end 
  def destroy
    plan = Plan.find(params[:id]) #データ(レコード)を1件取得
          plan.destroy #データ（レコード）を削除
          redirect_to plans_path #List一覧画面へリダイレクト
  end
    
  private
  def plan_params
  	params.require(:plan).permit(:word,:title,:user_id,:picture,:introduction,:date, plan_dates_attributes: [:image,:price,:place_name,:place_introduction,:time])
  end
   def baria_user
    unless Plan.find(params[:id]).user.id.to_i == current_user.id
        redirect_to plans_path(@plan)
    end
  end
end
