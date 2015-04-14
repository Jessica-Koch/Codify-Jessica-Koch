class MembershipsController < ApplicationController
  before_action :owners_only, only: [:edit, :update, :delete]

  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships.all
    @membership = Membership.new
  end

  def create
    @project = Project.find(params[:project_id])
    @membership = Membership.new(membership_params)
    @membership.project_id = @project.id
    if @membership.save
      redirect_to project_memberships_path(@project), notice:"#{@membership.user.full_name} was successfully added."
    else
      flash.now[:alert] = @membership.errors.full_messages
      render :index
    end
  end


  def update
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    if @membership.update(membership_params)
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully updated."
  end
end

  def destroy
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    @membership.destroy
      redirect_to projects_path, notice: "#{@membership.user.full_name} was successfully removed"
  end



    private
    def membership_params
      params.require(:membership).permit(:role, :user_id)
    end

    def owners_only
      unless @project.user.include?(current_user) && current_user.memberships.find_by(project_id: @project).owner?
        redirect_to @project, notice: 'You do not have access'
      end
    end
end
