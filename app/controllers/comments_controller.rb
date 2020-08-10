class CommentsController < ApplicationController
	def create
    plan = Plan.find(params[:plan_id])
	  comment = current_user.comments.new(comment_params)
    comment.plan_id = plan.id
     comment.save
      
	end
  def destroy
    Comment.find_by(id: params[:id], plan_id: params[:plan_id]).destroy
    
    end  
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end

