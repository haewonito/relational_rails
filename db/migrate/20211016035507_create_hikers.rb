class CreateHikers < ActiveRecord::Migration[5.2]
  def change
    create_table :hikers do |t|
      t.timestamps

      t.boolean :on_mountain
      t.integer :phone_num
      t.string :name
    end
  end
end
