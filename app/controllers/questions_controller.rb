# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]
  before_action :require_authentication
  before_action :fetch_question_responsible, only: %i[new edit]

  def index
    @questions = Question.includes(:user).where(user_id: current_user).page(params[:page]).per(10)
  end

  def new
    @question = Question.new
  end

  def create
    question = current_user.questions.build question_params
    if question.save
      flash[:check] = 'Заявка создана!'
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update question_params
      flash[:check] = 'Заявка обновлена'
      redirect_to questions_path(@questions)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    if @question.destroy
      flash[:times] = 'Ваша заявка была отменена'
      redirect_to questions_path
    end
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers.all
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, question_responsible_ids: [])
  end

  def set_question!
    @question = Question.find params[:id]
  end

  def fetch_question_responsible
    @question_responsibles = User.all
  end
end
