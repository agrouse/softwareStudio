class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :description
      t.string :password_digest
      t.string :username
      t.string :household
      t.timestamps null: false
    end
  end
end
