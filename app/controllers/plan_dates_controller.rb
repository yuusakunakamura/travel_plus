class PlanDatesController < ApplicationController
	def new
		@plan_date = PlanDate.new 
	end

	def index
		@plan_dates = PlanDate.all
	end

	def show
		@plan_date = PlanDate.find(params[:id])
   
	end

	def create
		@plan_date = PlanDate.new(plan_date_params)
   
   if @plan_date.save
           redirect_to plan_dates_path
          else
            @plan_dates= PlanDate.all
            render 'index'
  end
	end

	def edit
		@plan_date = PlanDate.find(params[:id])
	end

	def update
		@plan_date = PlanDate.find(params[:id])
  	@plan_date.update(plan_date_params)
  	redirect_to plan_date_path(@plan_date)
	end

	def destroy
		plan_date = PlanDate.find(params[:id]) #データ(レコード)を1件取得
          plan_date.destroy #データ（レコード）を削除
          redirect_to plan_dates_path #List一覧画面へリダイレクト
	end
		
	
	 private
  def plan_date_params
  	params.require(:plan_date).permit(:image,:price,:place_name,:place_introduction,:plan_id,:time,:date)
  end
end
