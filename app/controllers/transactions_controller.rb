# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :fetch_transaction

  def index
    @transaction ||= Transaction.new
    @transactions = Transaction.filter_records(params)
    respond_to do |format|
      format.html
      format.js { render json: @transactions }
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.save
  end

  def update
    @transaction.update_attributes(transaction_params)
  end

  def destroy
    @success = if @transaction.destroy
                 true
               else
                 false
               end
  end

  private

  def fetch_transaction
    @transaction = Transaction.find_by(id: params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:id, :price, :description,
                                        campaign_ids: [], contact_ids: [],
                                        campaigns_attributes: %i[id name budget description _destroy],
                                        contacts_attributes: %i[id first_name last_name email mobile _destroy])
  end
end
