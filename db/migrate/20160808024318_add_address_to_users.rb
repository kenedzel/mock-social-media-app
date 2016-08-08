class AddAddressToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :city_address, :string
  	add_column :users, :country, :string
  end
end
