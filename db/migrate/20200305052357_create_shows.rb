class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.references :channel, index: true
      t.datetime :play_time
      t.timestamps
    end
  end
end
