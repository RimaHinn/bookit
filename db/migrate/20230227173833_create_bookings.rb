class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :eventspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
