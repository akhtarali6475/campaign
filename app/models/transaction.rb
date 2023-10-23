# frozen_string_literal: true

class Transaction < ApplicationRecord

	validates :price, :description, presence: true

	has_and_belongs_to_many :campaigns
	has_and_belongs_to_many :contacts
end
