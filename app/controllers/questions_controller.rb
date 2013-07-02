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

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

end
