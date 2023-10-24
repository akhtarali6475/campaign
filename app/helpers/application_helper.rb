# frozen_string_literal: true

module ApplicationHelper
  def navbar_active(nav)
    'active' if nav == params[:controller]
  end
end
