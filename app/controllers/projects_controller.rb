class ProjectsController < ApplicationController
  before_action :authenticate
  before_action :members_only, only: [:show, :edit, :update, :destroy]
  before_action :owners_only, only: [:edit, :update, :destroy]

  def index
    if admin?
      @projects = Project.all
    else
      @projects = current_user.projects
    end
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

  def members_only
    project = Project.find(params[:id])
    unless project.users.include?(current_user) || admin?
     redirect_to projects_path, alert: "You do not have access to that project"
    end
  end

  def owners_only
    unless @projects = current_user.projects && current_user.memberships.find_by(role: Membership.roles[:owner], user_id: current_user) || admin?
      redirect_to projects_path, alert: 'You do not have access'
    end
  end

  def project_params
    params.require(:project).permit(:name)
  end

end
