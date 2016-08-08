class CreateCourse < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :name
    	t.belongs_to :user
    	t.belongs_to :school
    end
  end
end
