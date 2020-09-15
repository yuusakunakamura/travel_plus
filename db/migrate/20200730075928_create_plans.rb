# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :introduction
      t.string :picture
      t.integer :user_id
      t.date :date
      t.string :image_id
      t.integer :word, null: false, default: 0
      t.integer :oversea, null: false, default: 0
      t.timestamps
    end
  end
end
