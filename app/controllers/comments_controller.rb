class CommentsController < ApplicationController
	def create
    plan = Plan.find(params[:plan_id])
	  comment = current_user.comments.new(comment_params)
    comment.plan_id = plan.id
      if comment.save
      redirect_to root_path
    else
      redirect_to root_path
    end
	end
  def destroy
    Comment.find_by(id: params[:id], plan_id: params[:plan_id]).destroy
    redirect_to root_path
    end  
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
