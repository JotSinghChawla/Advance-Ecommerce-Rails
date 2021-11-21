class ApplicationController < ActionController::Base

    include ApplicationHelper

    protected

    def authenticate_admin!
        authenticate_user!
        flash[:alert] = "You are not authorized to access this page." unless current_user.admin?
        redirect_to '/' unless current_user.admin?
    end

end
