class AddNameToHouseHold < ActiveRecord::Migration
  def change
    add_column :households, :name, :string
  end
end
