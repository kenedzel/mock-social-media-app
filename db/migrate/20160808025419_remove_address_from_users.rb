class RemoveAddressFromUsers < ActiveRecord::Migration
  def change
  	  remove_column :users, :city_address
  	  remove_column :users, :country
  end
end
