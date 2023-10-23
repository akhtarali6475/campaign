# frozen_string_literal: true

class Campaign < ApplicationRecord

	validates :name, :budget, :description, presence: true

	has_and_belongs_to_many :contacts
	has_and_belongs_to_many :campaign_transactions, class_name: "Transaction"
end
