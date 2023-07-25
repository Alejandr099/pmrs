class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, :if => :devise_controller?

    def delete
      if @reservation.exists
        Reservation.find(@reservation.id)
        DeleteExpiredReservationJob.perform_now(@reservation.id)
      end
    end

    protected

    def configure_permitted_parameters
      @show_sidebar = true if account_signed_in?
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :url, :details, :avatar, :cover_image, :company])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
    end
end
