# frozen_string_literal: true

class CreateCampaignsTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns_transactions do |t|
      t.belongs_to :campaign, index: true, foreign_key: true
      t.belongs_to :transaction, index: true, foreign_key: true
    end
  end
end
