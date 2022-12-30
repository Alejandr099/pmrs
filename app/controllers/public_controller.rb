class PublicController < ApplicationController
  def main
    if account_signed_in?
      redirect_to dashboard_path, flash: { success: "Successfully signed in. Welcome to PMS!" } and return
    end
    @properties = Property.latest
  end
end
