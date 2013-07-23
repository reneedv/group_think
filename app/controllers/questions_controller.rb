class QuestionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_question, only: [:show, :edit, :update, :destroy]
  #before_filter :find_user, only: [:new, :create, :edit, :update]

  def index
    @questions = Question.all
  end

  def show

  end

  def new
    #@question = current_user.questions.build
    @question = Question.new

  end

  def create
    if @question = current_user.questions.create(params[:question])
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
    @question.users |= [current_user]
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

  # def find_user
  #   @user = User.find(params[:user_id])
  # end


end
