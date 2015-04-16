task cleanup: :environment do

  desc "removes all memberships where their users
  have already been deleted"
  task remove_deleted_user_memberships: :environment do
    Membership.all.each do |membership|
      if membership.user == nil
        membership.destroy
      end
    end
  end

   desc "removes all memberships where their projects
   have already been deleted"
   task remove_deleted_project_memberships: :environment do
     Membership.all.each do |membership|
       if membership.project == nil
         membership.destroy
       end
     end
   end

   desc "removes all tasks where their projects have
   already been deleted"
   task remove_deleted_project_tasks: :environment do
     Task.all.each do |task|
       if task.project == nil
         task.destroy
       end
     end
   end

   desc "removes all comments where their tasks have
   already been deleted"
   task remove_deleted_tasks_comments: :environment do
     Comment.all.each do |comment|
       if comment.task == nil
         comment.destroy
       end
     end
   end

   desc "sets the user_id of comments to nil if their
   users have been deleted"
   task set_comments_to_nil_if_user_deleted: :environment do
     Comment.all.each do |comment|
       if comment.user_id == nil
         @comment == nil
       end
     end
   end

   desc "removes any tasks with null project_id"
   task remove_task_without_project: :environment do
     Task.all.each do |task|
       if task.project_id == nil
         task.destroy
       end
     end
   end

   desc "removes any memberships with a null project_id
   or user_id"
   task remove_memberships_without_project_or_user: :environment do
     Membership.all.each do |membership|
       if membership.project_id.nil? || membership.user_id.nil?
         membership.destroy
       end
     end
   end

end
