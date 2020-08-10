class LikesController < ApplicationController
  
 def create
 	  @plan = Plan.find(params[:plan_id])
	  @like = current_user.likes.create(plan_id: params[:plan_id])
      
	end

	def destroy
	  @plan = Plan.find(params[:plan_id])
      @like = Like.find_by(plan_id: params[:plan_id], user_id: current_user.id)
      @like.destroy
      
    end
end
