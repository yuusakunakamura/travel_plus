# frozen_string_literal: true

class AddIsWithdrawalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_withdrawal, :boolean, default: false, null: false
  end
end
