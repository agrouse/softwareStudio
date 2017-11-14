class AddHouseholdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :household_id, :integer
    add_index :people, :household_id
  end
end
