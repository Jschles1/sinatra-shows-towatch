class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :network
      t.string :weekday
      t.string :showtime
      t.integer :user_id
    end
  end
end
