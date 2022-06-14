class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :registration, null: false, foreign_key: true
      t.datetime :date
    end
  end
end
