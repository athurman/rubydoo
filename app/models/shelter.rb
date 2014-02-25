class Shelter < ActiveRecord::Base
  default_scope { order("name ASC") }
end
