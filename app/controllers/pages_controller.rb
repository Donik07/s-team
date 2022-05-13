# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :require_authentication

  def index
    @questions = Question.includes(:user).where.not(statuses_id: 4).page(params[:page]).per(10).order(:statuses_id, created_at: :desc)
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
end
