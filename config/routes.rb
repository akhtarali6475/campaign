# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'campaigns#index'
  resources :campaigns, controller: 'campaigns', model: 'Campaign'
  resources :contacts, controller: 'contacts', model: 'Contact'
  resources :transactions, controller: 'transactions', model: 'Transaction'
end
