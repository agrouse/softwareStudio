class RemoveHouseholdToPeople < ActiveRecord::Migration
  def change
    remove_column :people, :household, :string
  end
end
