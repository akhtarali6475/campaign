# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates :price, :description, presence: true

  has_and_belongs_to_many :campaigns, uniq: true
  has_and_belongs_to_many :contacts, uniq: true

  accepts_nested_attributes_for :campaigns, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

  # Filter Reocrds
  def self.filter_records(args)
    if args[:_type] == 'query'
      Transaction.where('lower(description) LIKE ?', "%#{args[:term].downcase}%")
    else
      Transaction.includes(:contacts, :campaigns).order(created_at: :desc)
                 .paginate(page: args[:page], per_page: 10)
    end
  end
end
