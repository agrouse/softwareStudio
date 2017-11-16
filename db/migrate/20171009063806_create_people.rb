class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :description
      t.string :password_digest
      t.string :username
      t.references :household
      t.timestamps null: false
    end
  end
end
