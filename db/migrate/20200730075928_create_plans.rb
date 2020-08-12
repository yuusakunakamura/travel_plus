class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
    
    t.string :title
    t.text :introduction
    t.string :picture
    t.integer :user_id
    t.date :date
    t.string :word
      t.timestamps
    end
  end
end
