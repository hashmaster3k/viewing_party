class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.string :movie_title
      t.integer :duration
      t.string :date
      t.string :time
      t.timestamps
    end
  end
end
