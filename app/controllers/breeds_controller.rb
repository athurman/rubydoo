class BreedsController < ApplicationController

  def index
    params[:size]
    params[:energy]
    params[:time]
    params[:animal_friendly]
    params[:role]
    params[:grooming]
    params[:space]
  end

  def find
    @answers = Answer.all
  end
end
