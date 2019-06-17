class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :city, :string
    add_column :users, :school_name, :string
    add_column :users, :level_class, :string
    add_column :users, :number_mobile, :string
  end
end
