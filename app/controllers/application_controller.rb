class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json { head :forbidden }
          format.html { redirect_to root_path, notice: exception.message }
        end
      end
      before_action :configure_permitted_parameters, if: :devise_controller?
      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname])
      end    
end
