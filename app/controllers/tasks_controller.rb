class TasksController < ApplicationController
  before_action :authenticate

  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.all
  end

  def show
      @project = Product.find(params[:project_id])
      @task = @project.tasks.find(params[:id])
  end

  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = params[:project_id]

    if @task.save
      redirect_to projects_path, notice: "Task was successfully created!"
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to project_path(@task.project_id), notice: "Task was successfully updated!"
    else
      render :edit
  end
end

  def destroy
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])

    @task.destroy
    redirect_to project_tasks_path(@project), notice: "Your task was deleted!"
    end


  private

    def task_params
      params.require(:task).permit(:description, :duedate, :completed, :project_id)
    end
  end
