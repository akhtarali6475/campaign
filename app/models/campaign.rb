# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :name, :budget, :description, presence: true

  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :campaign_transactions, class_name: 'Transaction'

  accepts_nested_attributes_for :campaign_transactions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

  # Filter Reocrds
  def self.filter_records(args)
    if args[:_type] == 'query'
      Campaign.where('lower(name) LIKE ?', "%#{args[:term].downcase}%")
    else
      Campaign.includes(:contacts, :campaign_transactions)
              .order(created_at: :desc).paginate(page: args[:page], per_page: 10)
    end
  end
end
