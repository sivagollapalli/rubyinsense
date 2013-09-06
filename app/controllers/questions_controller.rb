class QuestionsController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    @question.save
    respond_with @question
  end

  def edit
    respond_with Question.find params[:id]
  end
  
  def update
    @question = Question.find params[:id]
    respond_with @question.update_attributes(params[:question])
  end

  def index
    respond_with Question.all
  end

  def my_questions
    respond_with current_user.questions
  end
    
  def show
    respond_with Question.find(params[:id])
  end

  def destroy
    question = current_user.questions.find(params[:id])
    respond_with question.destroy
  end
end
