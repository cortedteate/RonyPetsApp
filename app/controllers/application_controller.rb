class ApplicationController < ActionController::Base
    # before_action :authenticate_user!

    layout :layout_by_resource

    private

    def layout_by_resource 
        if user_signed_in?
            current_user.try(:admin?) ? "adminportal" : "portal"
        elsif devise_controller?
            "devise"
        else 
            "application"
        end
    end

end
