# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.decimal :budget, precision: 12, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
