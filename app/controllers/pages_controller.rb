# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]
  before_action :require_authentication

  def index
    @questions = Question.includes(:user).page(params[:page]).per(10)
  end

  def new
    redirect_to url_for(:controller => :questions, :action => :new)
  end

  def create
    redirect_to url_for(:controller => :questions, :action => :create)
  end

  def edit; end

  def update
    redirect_to url_for(:controller => :questions, :action => :update)
  end

  def destroy
    redirect_to url_for(:controller => :questions, :action => :destroy)
  end

  def show
    redirect_to url_for(:controller => :questions, :action => :show)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
