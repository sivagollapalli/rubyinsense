class QuestionsController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, except: [:index]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find params[:id]
  end
  
  def update
    @question = Question.find params[:id]
    if @question.update_attributes(params[:question])
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def index
    respond_with Question.all
  end

  def my_questions
    @questions = current_user.questions
  end
    
  def show
    @question = Question.find(params[:id])
    @comment = @question.comments.build
  end

  def destroy
    question = current_user.questions.find(params[:id])
    question.destroy
    redirect_to questions_path
  end
end
