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
      shelter = Shelter.new(name: name,
                            petfinder_id: shelter_obj["id"]["$t"],
                            zip: shelter_obj["zip"]["$t"],
                            state: shelter_obj["state"]["$t"],
                            city: shelter_obj["city"]["$t"],
                            address: shelter_obj["address1"]["$t"],
                            email: shelter_obj["email"]["$t"])
      if shelter.valid?
        shelter.save
      end
    end
  end

  def self.parse_answer_values
    answers_file = File.read("./data/answers.json")
    answers = JSON.parse(answers_file)
    answers["answers"].each do |answer|
      answer_value = Answer.create(answer_value: answer["answer_value"])
    end
  end

  def self.parse_breeds
    breeds = File.read("./data/breeds.json")
    breeds_hash = JSON.parse(breeds)
    breeds_hash["breeds"].each do |breed_obj|
      breed = Breed.create(name: breed_obj["breed_name"],
                           size: breed_obj["size"],
                           lifespan: breed_obj["lifespan"],
                           weight: breed_obj["weight"],
                           height: breed_obj["height"],
                           group: breed_obj["group"],
                           exercise: breed_obj["exercise"],
                           grooming: breed_obj["grooming"],
                           family_friendly: breed_obj["family_friendly"],
                           role: breed_obj["role"],
                           temperament: breed_obj["temperament"],
                           image: breed_obj["image"])
    end
  end

  def self.parse_shelter_dogs(response)
    dogs = []
    parsed = JSON.parse(response.body)
    puts parsed["petfinder"]["pets"]["pet"]
    parsed["petfinder"]["pets"]["pet"].each do |pet_obj|
      shelter_dog = {}
      shelter_dog["name"] = pet_obj["name"]["$t"]
      shelter_dog["sex"] = pet_obj["sex"]["$t"]
      shelter_dog["age"] = pet_obj["age"]["$t"]
      shelter_dog["address"] = pet_obj["contact"]["address1"]["$t"]
      shelter_dog["city"] = pet_obj["contact"]["city"]["$t"] unless pet_obj["contact"]["city"].nil?
      shelter_dog["state"] = pet_obj["contact"]["state"]["$t"] unless pet_obj["contact"]["state"].nil?
      shelter_dog["zipcode"] = pet_obj["contact"]["zip"]["$t"] unless pet_obj["contact"]["zip"].nil?
      shelter_dog["contact_name"] = pet_obj["contact"]["name"]["$t"] unless pet_obj["contact"]["name"].nil?
      shelter_dog["email"] = pet_obj["contact"]["email"]["$t"] unless pet_obj["contact"]["email"].nil?
      shelter_dog["contact_phone"] = pet_obj["contact"]["phone"]["$t"] unless pet_obj["contact"]["phone"].nil?

      shelter_dog["description"] = pet_obj["description"]["$t"]
      shelter_dog["image"] = pet_obj["media"]["photos"]["photo"].first["$t"] unless pet_obj["contact"]["phone"].nil?
      shelter_dog["breeds"] = []
      if pet_obj["breeds"]["breed"].is_a?(Array)
        pet_obj["breeds"]["breed"].each do |breed_hash|
          shelter_dog["breeds"] << breed_hash["$t"]
        end
      else
        shelter_dog["breeds"] << pet_obj["breeds"]["breed"]["$t"]
      end
      dogs << shelter_dog
    end
    dogs
  end
end