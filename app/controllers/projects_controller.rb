class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_project, only: [:show, :edit]

  def index
    @projects = Project.all
  end
  
  def personal
    @projects = Project.all
    @owner_projects = @projects.where(owner_id: current_user.id)
  end

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
 
  def show
    @funding = Funding.new()
  end

  def edit  
  end

  def update
    @project.name = params[:name]
    @project.total_funding = params[:total_funding]
    @project.category = params[:category]
    redirect_to project_path(@project)
  end


  private

  def project_params
    params.require(:project).permit(:name, :total_shares, :total_funding, :category, :owner_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
