class CreateAdkMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :adk_mountains do |t|
      t.timestamps
      
      t.boolean :high_peak
      t.integer :elevation
      t.string :name
    end
  end
end
