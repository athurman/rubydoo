require "petfinder.rb"

class SheltersController < ApplicationController
  def index
    if params[:search] =~ /\d{5}/
      @shelters = Shelter.search(params[:search])
      if @shelters.blank?
        PetFinder.retrieve_shelters(params[:search])
        @shelters = Shelter.search(params[:search])
      end
      @hash = Gmaps4rails.build_markers(@shelters) do |shelter, marker|
        marker.lat shelter.latitude
        marker.lng shelter.longitude
      end
    else
      flash[:alert] = "Invalid Zipcode, please try again"
      redirect_to root_path
    end
  end

  def new
  end

  def create
  end

  private
  def shelter_params
    params.require(:shelter).permit(:name).permit(:address).permit(:city).permit(:state).permit(:zip)
  end
end
