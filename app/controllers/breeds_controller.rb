class BreedsController < ApplicationController

  def index
    params[:size]
    params[:energy]
    params[:time]
    params[:animal_friendly]
    params[:role]
    params[:grooming]
    params[:space]
    # i = 0
    # all_breeds = Breed.all
    # all_breeds.each do
    #   score = Breed.generate_score([], all_breeds[i].id)
    # end
    # output.sort_by {|k, v| v}.reverse
  end

  def find
    @answers = Answer.all
  end
end
