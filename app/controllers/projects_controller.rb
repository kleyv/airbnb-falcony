class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_project, only: [:show, :edit, :update]

  def index
    if params["search"] && params["search"]["categories"]
      @projects = Project.where(category: params["search"]["categories"])
      session[:category] = params["search"]["categories"]
    else
    @projects = Project.all
    end
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
    @project.total_shares = rand(1..100)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    @funding = Funding.new()
    @fundings = Funding.all.where(project_id: @project.id)
  end

  def accept
    @project = Project.find(params[:id])
    @funding = Funding.find(params[:funding])
    @funding.accepted = true
    if @funding.save
      redirect_to project_path(@project)
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
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
