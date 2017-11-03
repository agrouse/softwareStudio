class AddLastNameToPeople < ActiveRecord::Migration
  def change
    add_column :people, :last_name, :string
  end
end
