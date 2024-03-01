class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json { head :forbidden }
          format.html { redirect_to root_path, notice: exception.message }
        end
      end
      before_action :authenticate_guest
      before_action :configure_permitted_parameters, if: :devise_controller?
      protected
      def authenticate_guest
        if cookies[:guest_token]
          puts "--------"
          puts "TRUE"
          puts "--------"
          @guest = Guest.find_by_token(cookies[:guest_token])
        else
          puts "--------"
          puts "FALSE"
          puts "--------"
          guest_token = SecureRandom.uuid
          cookies[:guest_token] =  guest_token
          @guest = Guest.create!(token: guest_token)
        end
      end
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname])
      end    
end
