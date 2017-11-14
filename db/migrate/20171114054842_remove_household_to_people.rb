class RemoveHouseholdToPeople < ActiveRecord::Migration
  def change
    remove_index :people, :household_id
    remove_column :people, :household_id, :integer
  end
end
