class AddHouseholdToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :household, index: true
    add_foreign_key :people, :household
  end
end
