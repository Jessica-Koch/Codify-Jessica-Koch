class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
    end
  end
end
