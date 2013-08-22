class QuestionsController < ApplicationController
   before_filter :authenticate_user!, except: [:index, :show]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    if @question.save
      Twitter.update('@'+ current_user.twitter_handle + " added a question to #rubyinsense..!! Here it is " + @question.url_shortner('http://rubyinsense.heroku.com/questions/'+@question.id)) unless Rails.env.development?
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
    @questions = Question.all.desc(:created_at)
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

  def vote
    @answer = Answer.find(params[:id])
    current_user.vote(@answer, params[:type].to_sym)
  end
end
