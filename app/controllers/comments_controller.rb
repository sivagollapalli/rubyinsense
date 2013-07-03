class CommentsController < ApplicationController
  def create 
    @question = Question.find(params[:question_id])
    @comment = @question.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Comment Added Succesfully'
      redirect_to question_path(@question)
    else
      render template: 'questions/show' 
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    comment = Comment.find(params[:id])
    not_authorized unless comment.user == current_user
    comment.destroy
    flash[:notice] = 'Comment removed Successfully'
    redirect_to question_path(@question)
  end
end
