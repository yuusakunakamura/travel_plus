# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    @comment = @plan.comments.build(comment_params)
    @comment.user_id = current_user.id
    render :index if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    render :index if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :plan_id, :user_id)
  end
end
