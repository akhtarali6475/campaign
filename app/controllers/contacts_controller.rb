# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :fetch_contact, except: [:create]

  def index
    @contact ||= Contact.new
    @contacts = Contact.filter_records(params)

    respond_to do |format|
      format.html
      format.js { render json: @contacts }
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
  end

  def update
    @contact.update(contact_params)
  end

  def destroy
    @success = if @contact.destroy
                 true
               else
                 false
               end
  end

  private

  def fetch_contact
    @contact = Contact.find_by(id: params[:id])
  end

  def contact_params
    params.require(:contact).permit(:id, :first_name, :last_name, :email, :mobile,
                                    campaign_ids: [], contact_transaction_ids: [],
                                    campaigns_attributes: %i[id name budget description _destroy],
                                    contact_transactions_attributes: %i[id price description _destroy])
  end
end
