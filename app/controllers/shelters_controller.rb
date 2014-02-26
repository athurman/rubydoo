class SheltersController < ApplicationController
  def index
    if params[:search] =~ /\d{5}/
      @shelters = Shelter.search(params[:search])
    else
      flash[:alert] = "Invalid Zipcode, please try again"
      render static_pages_form_path
    end
  end

  def new
  end

  def create
  end
end
