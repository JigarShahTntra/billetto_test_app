require "clerk/authenticatable"

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :check_clerk_user
  include Clerk::Authenticatable

  allow_browser versions: :modern

  def check_clerk_user
    unless action_name.eql?("index") || clerk_user_signed_in?
      redirect_to Rails.application.credentials.dig(:clerk, :sign_in_url), allow_other_host: true
    end
  end

  private

  def command_bus
    Rails.configuration.command_bus
  end
end
