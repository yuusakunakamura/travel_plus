# frozen_string_literal: true

class CreatePlanDates < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_dates do |t|
      t.string :image_id
      t.integer :price
      t.string :place_name
      t.text :place_introduction
      t.string :picture
      t.references :plan, foreign_key: true
      t.time :time
      t.timestamps
    end
  end
end
