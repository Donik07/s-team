# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_question!
  before_action :my_message?, only: %i[edit update destroy]

  def create
    @answer = @question.answers.build answer_create_params

    if @answer.save
      redirect_to question_path(@question)
    else
      @answers = @question.answers.order created_at: :desc
      render 'questions/show'
    end
  end

  def show; end

  def edit
    @answer = @question.answers.find params[:id]
  end

  def update
    answer = @question.answers.find params[:id]
    if answer.update answer_update_params
      flash[:check] = 'Сообщение изменено!'
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    answer = @question.answers.find params[:id]
    answer.destroy
    flash[:times] = 'Сообщение удалено!'
    redirect_to question_path(@question)
  end

  private

  def my_message?
    answer = @question.answers.find params[:id]
    return if answer.user.id == current_user.id

    flash[:times] = "Вы не можете редактировать чужое сообщение!"
    redirect_to questions_path
  end

  def answer_create_params
    params.require(:answer).permit(:body).merge(user: current_user)
  end

  def answer_update_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find params[:question_id]
  end

end
