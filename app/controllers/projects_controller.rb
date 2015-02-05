class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end


private

def set_task
  @task = Task.find(params[:id])
end
end
