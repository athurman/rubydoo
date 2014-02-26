require 'active_record'
require 'httparty'
require 'json'
require 'digest'

class PetFinder
  include HTTParty
  BASE_URL = 'http://api.petfinder.com/'

  def self.get_token
    secret = Digest::MD5.hexdigest(ENV['PETFINDER_SECRET'] + 'key=' + ENV['PETFINDER_API_KEY'] + '&format=json')
    response = HTTParty.get(BASE_URL + 'auth.getToken?key=' + ENV['PETFINDER_API_KEY'] + '&format=json&sig=' + secret)
    parsed = JSON.parse(response.body)
    parsed["petfinder"]["auth"]["token"]["$t"]
  end

  def self.retrieve_shelters zip_code
    token = PetFinder.get_token
    zip = zip_code.to_s
    secret = Digest::MD5.hexdigest(ENV['PETFINDER_SECRET'] + 'key=' + ENV['PETFINDER_API_KEY'] + '&location=' + zip + '&format=json&token=' + token)
    response = HTTParty.get(BASE_URL + 'shelter.find?key=' + ENV['PETFINDER_API_KEY'] + '&location=' + zip + '&format=json&token=' + token + '&sig=' + secret)
    parsed = JSON.parse(response.body)
    parsed["petfinder"]["shelters"]["shelter"].each do |shelter_obj|
      longitude = shelter_obj["longitude"]["$t"]
      name =  shelter_obj["name"]["$t"]
      name.each_char do |char|
        if char == "'"
          name.delete!(char)
        end
      end
      state = shelter_obj["state"]["$t"]
      email = shelter_obj["email"]["$t"]
      city = shelter_obj["city"]["$t"]
      api_zip =  shelter_obj["zip"]["$t"]
      latitude = shelter_obj["latitude"]["$t"]
      petfinder_id =  shelter_obj["id"]["$t"]
      address = shelter_obj["address1"]["$t"]
      shelter = Shelter.create(name: name, petfinder_id: petfinder_id, longitude: longitude, latitude: latitude, zip: api_zip, state: state, city: city, address: address, email: email)
    end
  end
end