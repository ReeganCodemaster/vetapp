class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.datetime :registration_date
      t.boolean :accepted, default: false
      t.timestamps
    end
    
  end
end
