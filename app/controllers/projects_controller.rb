class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_all_project, only: [:personal]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if params["search"] && params["search"]["categories"] == "-------------"
      @projects = Project.all
      session[:category] = nil
    elsif params["search"] && params["search"]["categories"]
      @projects = Project.where(category: params["search"]["categories"])
      session[:category] = params["search"]["categories"]
    else
      @projects = Project.all
    end
  end

  def personal
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
    fundings = Funding.all.where(project_id: @project.id)
    @fundings_a = []
    @fundings_o = []
    fundings.each do |funding|
      if funding.accepted?
        @fundings_a << funding
      else
        @fundings_o << funding
      end
    end
  end

  def accept
    @project = Project.find(params[:id])
    @funding = Funding.find(params[:funding])
    @funding.accepted = true
    if @funding.save
      redirect_to project_path(@project)
    end
  end

  def bookmark
    @bookmark = Bookmark.new
    @project = Project.find(params[:id])
    @bookmark.investor = current_user
    @bookmark.project = @project
    @bookmark.save
    redirect_to projects_path, notice: 'Bookmarked!'
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :total_shares, :total_funding, :category, :owner_id, :photo)
  end



  def set_all_project
    @projects = Project.all
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
