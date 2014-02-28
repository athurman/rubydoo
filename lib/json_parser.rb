require 'active_record'
require 'json'

class JsonParser

  def self.parse_shelters(response)
    parsed = JSON.parse(response.body)
    parsed["petfinder"]["shelters"]["shelter"].each do |shelter_obj|
      name =  shelter_obj["name"]["$t"]
      name.each_char do |char|
        if char == "'"
          name.delete!(char)
        end
      end
      shelter = Shelter.create(name: name, petfinder_id: shelter_obj["id"]["$t"], zip: shelter_obj["zip"]["$t"], state: shelter_obj["state"]["$t"], city: shelter_obj["city"]["$t"], address: shelter_obj["address1"]["$t"], email: shelter_obj["email"]["$t"])
    end
  end

end