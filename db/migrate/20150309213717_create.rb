class Create < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.integer :role
    end
  end
end
