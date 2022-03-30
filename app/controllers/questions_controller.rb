# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]
  before_action :require_authentication

  def index
    @questions = Question.all.page(params[:page]).per(10)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
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
      redirect_to questions_path(@questions, '#question-4')
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
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
