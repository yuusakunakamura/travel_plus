class CreateMarkers < ActiveRecord::Migration[5.2]
  def change
    create_table :markers do |t|
      t.string :title
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
