class AddAdkMountainToHikers < ActiveRecord::Migration[5.2]
  def change
    add_reference :hikers, :adk_mountain, foreign_key: true
  end
end
