class Shelter < ActiveRecord::Base
  default_scope { order("name ASC") }

  def self.search zip_code
    Shelter.where(zip: zip_code)
  end
end
