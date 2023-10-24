# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates :price, :description, presence: true

  has_and_belongs_to_many :campaigns
  has_and_belongs_to_many :contacts

  accepts_nested_attributes_for :campaigns, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true
end
