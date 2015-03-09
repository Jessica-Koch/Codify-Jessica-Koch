class MembershipsController < ApplicationController
  before_action :authenticate

  def index
    @project = Project.find(params[:project_id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
