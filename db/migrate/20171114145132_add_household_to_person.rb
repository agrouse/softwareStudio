class AddHouseholdToPerson < ActiveRecord::Migration
  def change
    add_reference :people, :household, index: true, foreign_key: true
  end
end
