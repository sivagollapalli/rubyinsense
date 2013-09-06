class QuestionsController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    @question.save
    Twitter.update('@'+ current_user.twitter_handle + " added a question to #rubyinsense..!! Here it is " + @question.url_shortner('http://rubyinsense.heroku.com/questions/'+@question.id)) unless Rails.env.development?
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
    respond_with Question.highest_rated
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

  def vote
    model = params[:id].constantize
    @model = model.find(params[:id])
    current_user.vote(@answer, params[:type].to_sym)
  end

  def rating
    @question = Question.where(id: params[:id]).first
    @question.rate_and_save(params[:score], current_user)
  end
end
