class RemoveEducationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :course
  	remove_column :users, :school
  end
end
