class ProjectsController < ApplicationController
  before_action :authenticate
  before_action :members_only, only: [:index]

  def index
    @projects = Project.all

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      @project.memberships.create(user: current_user, role: 'owner')
      redirect_to project_tasks_path(@project), notice:"Project was successfully created!"
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated!"
    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to @project, notice: 'Project was successfully deleted!'
  end


  private
  def project_params
    params.require(:project).permit(:name)
  end

  def members_only
    unless current_user.memberships.roles
      redirect_to projects_path, notice: "You do not have access to that project" 
    end
  end
end
