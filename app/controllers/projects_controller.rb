class ProjectsController < ApplicationController
  before_action :authenticate
  before_action :owners_only, only: [:edit, :update, :delete]
  before_filter :members_only, only: [:edit, :update, :delete]

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

  def owners_only
    unless @project.users.include?(current_user) && current_user.memberships.find_by(project_id: @project).owner? || admin?
      redirect_to projects_path, notice: 'You do not have access'
    end
  end

  def members_only
    unless current_user.memberships.find_by(project_id: @project) || admin?
     redirect_to projects_path, notice: "You do not have access to that project"
    end
  end
end
