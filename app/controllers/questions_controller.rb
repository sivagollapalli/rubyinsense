class QuestionsController < ApplicationController
   before_filter :authenticate_user!

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    @question.save
    redirect_to questions_path
  end

  def edit
    @question = Question.find params[:id]
  end
  
  def update
    @question = Question.find params[:id]
    @question.update_attributes(params[:question])
    redirect_to questions_path
  end

  def index
    @questions = Question.all
  end

end
