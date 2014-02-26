require "petfinder.rb"

class SheltersController < ApplicationController
  def index
    if params[:search] =~ /\d{5}/
      @shelters = Shelter.search(params[:search])
      if @shelters.blank?
        PetFinder.retrieve_shelters(params[:search])
        @shelters = Shelter.search(params[:search])
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
end
