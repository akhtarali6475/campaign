# frozen_string_literal: true

class CreateCampaignsContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns_contacts do |t|
      t.belongs_to :campaign, index: true, foreign_key: true
      t.belongs_to :contact, index: true, foreign_key: true
    end
    add_index :campaigns_contacts, [:campaign_id, :contact_id], unique: true
  end
end
