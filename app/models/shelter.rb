class Shelter < ActiveRecord::Base
  default_scope { order("name ASC") }
  geocoded_by :full_address
  after_validation :geocode

  def self.search zip_code
    Shelter.where(zip: zip_code)
  end

  def full_address
    unless address.nil?
      full_address = "#{name}, #{address}, #{city}, #{state}, #{zip}"
    else
      full_address = "#{name}, #{city}, #{state}, #{zip}"
    end
    full_address
  end

  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|shelter| [shelter.name, shelter.city, shelter.state] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end
  end
end

Shelter.dedupe
