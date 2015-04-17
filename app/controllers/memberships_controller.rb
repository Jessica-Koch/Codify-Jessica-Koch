class MembershipsController < ApplicationController
  before_action :set_project
  before_action :members_only
  before_action :owners_only, only: [:edit, :update, :destroy]

  def index
    @memberships = @project.memberships.all
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.project_id = @project.id
    if @membership.save
      redirect_to project_memberships_path(@project), notice:"#{@membership.user.full_name} was successfully added."
    else
      render :index
    end
  end

  def update
    @membership = Membership.find(params[:id])
    if @membership.update(membership_params)
      @memberships = @project.memberships

      if @membership.update(role: 'owner') && current_user.last_owner?(@project)
        redirect_to project_memberships_path(@project), alert: "Projects must have at least one owner"
      else
        # @owners_count == 1
        @membership.update(membership_params)

      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully updated."
    end
  end
end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
      redirect_to projects_path, notice: "#{@membership.user.full_name} was successfully removed"
  end


    private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def members_only
      project = Project.find(params[:project_id])
      unless project.users.include?(current_user) || admin?
       redirect_to projects_path, alert: "You do not have access to that project"
      end
    end

    def owners_only
      project = Project.find(params[:project_id])
      unless project.users.include?(current_user) && current_user.memberships.find_by(project_id: @project).owner? || admin?
        redirect_to @project, alert: 'You do not have access'
      end
    end

    def membership_params
      params.require(:membership).permit(:role, :user_id)
    end

end
