# frozen_string_literal: true

class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      flash[:check] = 'Проект создан!'
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(:project_name)
  end
end
