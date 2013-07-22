class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])

    if @question.save
      flash[:notice] = "QQQuestion asked!"
      redirect_to @question
    else

    end
  end

end
