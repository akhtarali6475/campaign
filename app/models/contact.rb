# frozen_string_literal: true

class Contact < ApplicationRecord
	validates :first_name, :last_name, :mobile, presence: true
	validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
	validates :mobile, format: { with: /\A\d{10}\z/, message: "should be a 10-digit number" }

	has_and_belongs_to_many :campaigns
	has_and_belongs_to_many :contact_transactions, class_name: "Transaction"

	accepts_nested_attributes_for :campaigns, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :contact_transactions, reject_if: :all_blank, allow_destroy: true
end
