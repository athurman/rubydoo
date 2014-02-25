class SheltersController < ApplicationController
  def index
    @shelters = Shelter.search(params[:search])
  end

  def new
  end

  def create
  end
end
