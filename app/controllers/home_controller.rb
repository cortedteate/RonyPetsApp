class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.admin?
       redirect_to programs_path
    end
  end
end
