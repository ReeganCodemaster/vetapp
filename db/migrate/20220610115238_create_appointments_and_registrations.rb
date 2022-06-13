class CreateAppointmentsAndRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.datetime :registration_date
      t.boolean :accepted, default: false
      t.timestamps
    end
    
    create_table :appointments do |t|
      t.belongs_to :users
      t.belongs_to :registrations
      t.datetime :appointment_date
    end
  end
end
