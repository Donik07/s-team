class AnswersController < ApplicationController
  before_action :get_question!

  def create
    @answer = @question.answers.build answer_params

    if @answer.save
      redirect_to question_path(@question)
    else
      @answers = @question.answers.order created_at: :desc
      render 'questions/show'
    end
  end

  def show

  end

  def edit
    @answer = @question.answers.find params[:id]
  end

  def update
    answer = @question.answers.find params[:id]
    if answer.update answer_params
      flash[:check] = "Сообщение изменено!"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    answer = @question.answers.find params[:id]
    answer.destroy
    flash[:times] = "Сообщение удалено!"
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def get_question!
    @question = Question.find params[:question_id]
  end
end
