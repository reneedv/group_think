class QuestionsController < ApplicationController
  before_filter :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])

    if @question.save
      flash[:notice] = "QQQuestion asked!"
      redirect_to @question
    # else
    #   flash[:alert] = "Question has not been created."
    #   render :action => "new"
    end
  end

  def edit

  end

  def update
    @question.update_attributes(params[:question])
    flash[:notice] = "Question Updated"
    redirect_to @question

  end

  def destroy
    @question.destroy
    flash[:notice] = "Question has been deleted."
    redirect_to questions_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end


end
