class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
    t.string :image_id
    t.integer :price
    
    t.string :title
    t.text :introduction

    t.string :place_name
    t.text :place_introduction

    t.string :picture
   
    t.integer :user_id
    
    t.time :time
    t.date :date
      t.timestamps
    end
  end
end
