class AddEducationToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :course, :string
  	add_column :users, :school, :string
  end
end
