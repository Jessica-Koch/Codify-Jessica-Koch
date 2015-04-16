task cleanup: :environment do

  desc "removes all memberships where their users
  have already been deleted"
  task remove_memberships: :environment do
    Membership.all.each do |membership|
      if user.membership == nil
        membership.destroy
      end
    end
  end

  # desc "removes all memberships where their projects
  # have already been deleted"
  #
  # desc "removes all tasks where their projects have
  # already been deleted"
  #
  # desc "removes all comments where their tasks have
  # already been deleted"
  #
  # desc "sets the user_id of comments to nil if their
  # users have been deleted"
  #
  # desc "removes any tasks with null project_id"
  #
  # desc "removes any memberships with a null project_id
  # or user_id"


end
