class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :users
      t.belongs_to :pets
      t.datetime :appointment_date
    end
  end
end
