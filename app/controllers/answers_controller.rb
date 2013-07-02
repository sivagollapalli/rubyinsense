class AnswersController < ApplicationController
  before_filter :load_question

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(params['answer'])
    @answer.user = current_user
    if @answer.save
      redirect_to question_path(@question)
    else
      render action: :new
    end
  end

  def edit
    @answer = @question.answers.find(params[:id])
    render action: :new
  end


  def update
    @answer = @question.answers.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to question_path(@question)
    else
      render action: :edit
    end
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end
end
