# frozen_string_literal: true

class ContactsController < ApplicationController
	before_action :fetch_contact

	def index
		@contact  ||= Contact.new
		@contacts = Contact.paginate(page: params[:page], per_page: 10)
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.save
			redirect_to contacts_path
		else
			render 'index'
		end
	end

	def update
		if @contact.update_attributes(contact_params)
			redirect_to contacts_path
		else
			render 'index'
		end
	end

	def destroy
		msg = if @contact.destroy
			"Record Deleted Successfully."
		else
			"Unable to delete Record."
		end
		redirect_to contacts_path
	end

	private

	def fetch_contact
		@contact = Contact.find_by(params[:id])
	end

	def contact_params
    params.require(:contact).permit(:id, :first_name, :last_name, :email, :mobile,
    	                               campaign_ids: [], transaction_ids: [],
    	                               campaigns_attributes: [:id, :name, :budget, :description, :_destroy],
    	                               contact_transactions_attributes: [:id, :price, :description, :_destroy])
  end
end
