class CreateSchool < ActiveRecord::Migration
  def change
    create_table :schools do |t|
    	t.string :school_name
    	t.belongs_to :user
    end
  end
end
