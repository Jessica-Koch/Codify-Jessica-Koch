class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @comment = Comment.new(comment_params)
    @task = Task.find(params[:task_id])
    @comment.user_id = current_user.id
    @comment.task_id = @task.id
    if @comment.save
      redirect_to project_task_path(@project, @task)
    else
      redirect_to project_task_path(@project, @task)
    end
  end

    private
    def comment_params
      params.require(:comment).permit(:body, :task_id, :user_id, :created_at)
    end
end
