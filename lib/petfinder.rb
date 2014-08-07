require 'active_record'
require 'httparty'
require 'digest'

class PetFinder
  include HTTParty
  BASE_URL = 'http://api.petfinder.com/'

  def self.retrieve_shelters(zip_code)
    zip = zip_code.to_s
    secret = Digest::MD5.hexdigest(ENV['PETFINDER_SECRET'] + 'key=' + ENV['PETFINDER_API_KEY'] + '&location=' + zip + '&format=json')
    response = HTTParty.get(BASE_URL + 'shelter.find?key=' + ENV['PETFINDER_API_KEY'] + '&location=' + zip + '&format=json&sig=' + secret)
    JsonParser.parse_shelters(response)
  end

  def self.retrieve_shelter_dogs(zip_code, breed_name)
    zip = zip_code.to_s
    secret = Digest::MD5.hexdigest(ENV['PETFINDER_SECRET'] + 'key=' + ENV['PETFINDER_API_KEY'] + '&location=' + zip + '&animal=dog&breed=' + breed_name + '&count=40&format=json')
    response = HTTParty.get(BASE_URL + 'pet.find?key=' + ENV['PETFINDER_API_KEY'] + '&location=' + zip + '&animal=dog&breed=' + breed_name + '&count=40&format=json&sig=' + secret)
    JsonParser.parse_shelter_dogs(response)
  end
end