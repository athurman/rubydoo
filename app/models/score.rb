class Score < ActiveRecord::Base
  belongs_to :breed
  belongs_to :answer
end
