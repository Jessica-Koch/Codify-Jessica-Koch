class AddDefaultRole < ActiveRecord::Migration
  def change
    change_column :memberships, :role, :integer, :default => 0
  end
end
