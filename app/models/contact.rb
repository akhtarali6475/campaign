# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :first_name, :mobile, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :mobile, format: { with: /\A\d{10}\z/, message: 'should be a 10-digit number' }

  has_and_belongs_to_many :campaigns, uniq: true
  has_and_belongs_to_many :contact_transactions, class_name: 'Transaction', uniq: true

  accepts_nested_attributes_for :campaigns, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :contact_transactions, reject_if: :all_blank, allow_destroy: true

  # Filter Reocrds
  def self.filter_records(args)
    if args[:_type] == 'query'
      Contact.where('lower(email) LIKE ?', "%#{args[:term].downcase}%")
    else
      Contact.includes(:campaigns, :contact_transactions)
             .order(created_at: :desc).paginate(page: args[:page], per_page: 10)
    end
  end
end
