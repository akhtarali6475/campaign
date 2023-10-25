# frozen_string_literal: true

class CampaignsController < ApplicationController
  before_action :fetch_campaign, except: [:create]

  def index
    @campaign ||= Campaign.new
    @campaigns = Campaign.filter_records(params)
    respond_to do |format|
      format.html
      format.js { render json: @campaigns }
    end
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.save
  end

  def update
    @campaign.update_attributes(campaign_params)
  end

  def destroy
    @success = if @campaign&.destroy
                 true
               else
                 false
               end
  end

  private

  def fetch_campaign
    @campaign = Campaign.find_by(id: params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:id, :name, :budget, :description,
                                     contact_ids: [], campaign_transaction_ids: [],
                                     contacts_attributes: %i[id first_name last_name email mobile _destroy],
                                     campaign_transactions_attributes: %i[id price description _destroy])
  end
end
