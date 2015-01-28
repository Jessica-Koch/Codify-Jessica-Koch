class AddDueDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :duedate, :date
  end
end
