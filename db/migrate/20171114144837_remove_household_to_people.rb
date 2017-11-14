class RemoveHouseholdToPeople < ActiveRecord::Migration
  def change
    remove_reference :people, :household, index: true
  end
end
