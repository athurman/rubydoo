class Shelter < ActiveRecord::Base
  validates :petfinder_id, uniqueness: true
  default_scope { order("name ASC") }
  geocoded_by :full_address
  after_validation :geocode

  def self.search(zip_code)
    Shelter.where(zip: zip_code)
  end

  def full_address
    unless address.nil?
      full_address = "#{address}, #{city}, #{state}, #{zip}"
    else
      full_address = "#{name}, #{city}, #{state}, #{zip}"
    end
    full_address
  end
end
