class RemoveNameToPeople < ActiveRecord::Migration
  def change
    remove_column :people, :name, :string
  end
end
