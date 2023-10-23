# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :price, precision: 12, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
