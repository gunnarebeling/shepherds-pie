class HomeController < ApplicationController
  before_action :authenticate_employee!
  def index
    # Add any logic you need for the index action here
  end
end
