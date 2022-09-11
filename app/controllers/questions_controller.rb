# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :require_authentication
  before_action :set_question!, only: %i[show destroy edit update start_working completed_working send_to_archive back_to_active]
  before_action :fetch_question_responsible, only: %i[new edit]
  before_action :fetch_projects, only: %i[new edit]

  def index
    @questions = Question.includes(:user).where(user_id: current_user).where.not(statuses_id: 4).page(params[:page]).per(10).order(:statuses_id, created_at: :desc)
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
      redirect_to new_question_path
      flash[:times] = "Ошибка, файл слишком большой!"
      # render :new
    end
  end

  def edit; end

  def update
    if @question.update question_params
      flash[:check] = 'Заявка обновлена'
      redirect_to questions_path+'/'+@question.id.to_s
    else
      render :edit
    end
  end

  def destroy
    @question.question_files.purge_later
    @question.destroy
    if @question.destroy
      flash[:times] = 'Ваша заявка была удалена'
      redirect_to archives_path
    end
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers.all
  end

  def start_working
    @question.update(statuses_id: 2)
    if @question.update(statuses_id: 2)
      flash[:exclamation] = "Статус заявки изменился на «В работе»"
      redirect_to questions_path+'/'+@question.id.to_s
    end
  end

  def completed_working
    @question.update(statuses_id: 3)
    if @question.update(statuses_id: 3)
      flash[:check] = "Статус заявки изменился на «Готово»"
      redirect_to questions_path+'/'+@question.id.to_s
    end
  end

  def send_to_archive
    @question.update(statuses_id: 4)
    if @question.update(statuses_id: 4)
      flash[:times] = "Заявка перенесена в «Архив»"
      DestroyInArchiveJob.perform_async('bob')
      # DestroyInArchiveJob.deliver_later(wait: 1.second)
      redirect_to questions_path
    end
  end

  def back_to_active
    @question.update(statuses_id: 1)
    if @question.update(statuses_id: 1)
      flash[:check] = "Статус заявки изменился на «Открыта»"
      redirect_to questions_path+'/'+@question.id.to_s
    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :body, :users_id, :statuses_id, :project_id, question_files: [])
  end

  def set_question!
    @question = Question.find params[:id]
  end

  def fetch_question_responsible
    @question_responsibles = User.all
  end

  def fetch_projects
    @collection_projects = Project.all
  end

end
