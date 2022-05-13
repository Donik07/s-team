# frozen_string_literal: true

class ArchivesController < ApplicationController
  before_action :require_authentication
  before_action :set_question!, only: %i[automatic_deletion created_at_is_old?]

  def index
    @questions = Question.where(statuses_id: 4).page(params[:page]).per(10).order(created_at: :desc)
  end

  def destroy
    redirect_to url_for(:controller => :questions, :action => :destroy)
  end

  def show
    redirect_to url_for(:controller => :questions, :action => :show)
  end

  def back_to_active
    redirect_to url_for(:controller => :questions, :action => :back_to_active)
  end


  private

  def created_at_is_old?
    created_at = @question.created_at.to_date
    today = DateTime.now
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
