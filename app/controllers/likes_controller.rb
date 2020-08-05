class LikesController < ApplicationController

	def create
	  @like = current_user.likes.create(plan_id: params[:plan_id])
      redirect_to plans_path(@plan)

	end

	def destroy
      @like = Like.find_by(plan_id: params[:plan_id], user_id: current_user.id)
      @like.destroy
      redirect_to plans_path(@plan)
    end
   
    
end
