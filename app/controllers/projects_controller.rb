class ProjectsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index
  before_action :set_project, only: [:show]


  def new
   @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @funding = Funding.new()
  end

  private

  def project_params
    params.require(:project).permit(:name, :total_shares, :open?, :total_funding, :category, :owner_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
