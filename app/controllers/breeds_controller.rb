require "petfinder.rb"
require "json_parser.rb"

class BreedsController < ApplicationController

  def index
    selected_answer_array = [params[:size], params[:energy], params[:time], params[:animal_friendly], params[:role], params[:grooming], params[:space]]
    top_eight_breeds = []
    i = 0
    all_breeds = Breed.all
    output = {}
    all_breeds.each do
      score = Breed.generate_score(selected_answer_array, all_breeds[i].id)
      output[all_breeds[i].id] = score
      i += 1
    end
    output = output.sort_by {|k, v| v}.reverse

    j = 0
    8.times do
      id = output[j][0]
      breed = Breed.find_by(id: id)
      top_eight_breeds << breed
      j += 1
    end
    @top_eight_breeds = top_eight_breeds
  end

  def find
    @answers = Answer.all
  end

  def shelter_dogs
    breed_name = params[:breed]
    zip_code = params[:zipcode]
    breed_name.tr!(' ', '+')
    @shelterdogs = PetFinder.retrieve_shelter_dogs(zip_code, breed_name)
  end
end
