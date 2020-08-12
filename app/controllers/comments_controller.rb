class CommentsController < ApplicationController
	 def create
    plan = Plan.find(params[:plan_id])
    comment = current_user.comments.new(comment_params)
    comment.plan_id = plan.id
     comment.save
      redirect_to plan_path(plan)
  end
  def destroy
    Comment.find_by(id: params[:id], plan_id: params[:plan_id]).destroy
     redirect_to plans_path(@plan)
    
    end  
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end

  