class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :genre
      t.integer :year
      t.boolean :used
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
