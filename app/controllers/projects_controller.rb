class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @projects = Project.all
  end

  def personal
    @projects = Project.all
    @owner_projects = @projects.where(owner_id: current_user.id)
  end

  def show
    @project = Project.find(params[:id])
  end
end
