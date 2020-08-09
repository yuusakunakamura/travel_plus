class PlansController < ApplicationController
  def new
  @plan = Plan.new
  end

  def create
  @plan = Plan.new(plan_params)
  @plan.user_id = current_user.id
   if @plan.save
           redirect_to plans_path
          else
            @plans = Plan.all
            render 'index'
  end
end
def show
    @plan = Plan.find(params[:id])
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
  	params.require(:plan).permit(:title,:time,:date,:user_id,:picture,:image,:price,:introduction,:place_name,:place_introduction
)
  end
end
