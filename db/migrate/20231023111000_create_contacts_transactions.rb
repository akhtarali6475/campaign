# frozen_string_literal: true

class CreateContactsTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts_transactions do |t|
      t.belongs_to :contact, index: true, foreign_key: true
      t.belongs_to :transaction, index: true, foreign_key: true
    end
    add_index :contacts_transactions, [:contact_id, :transaction_id], unique: true
  end
end
