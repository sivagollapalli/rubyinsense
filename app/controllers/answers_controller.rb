class AnswersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_question

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(params['answer'])
    @answer.user = current_user
    if @answer.save
      Twitter.update('@'+ current_user.twitter_handle + " added an answer to #rubyinsense..!! Here it is " + @question.url_shortner('http://rubyinsense.heroku.com/questions/'+@question.id)) unless Rails.env.development?
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
  
  def destroy
    @question = Question.find(params[:question_id])
    answer = Answer.find(params[:id])
    not_authorized unless answer.user == current_user
    answer.destroy
    flash[:notice] = 'Answer removed Successfully'
    redirect_to question_path(@question)
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end
end
