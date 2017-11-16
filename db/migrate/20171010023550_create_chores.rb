class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :task
      t.string :priority
      t.string :status
      t.string :description
      t.string :person_assigned
      t.datetime :last_accomplished
      t.string :history
      t.references :household
      t.timestamps
    end
  end
end