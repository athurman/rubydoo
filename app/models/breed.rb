class Breed < ActiveRecord::Base
  has_many :scores

  def self.generate_score(survey_array, breed_id)
    scores = []
    total_score = 0
    survey_array.each do |input_id|
      score = Score.find_by(answer_id: input_id, breed_id: breed_id)
      scores << score.score
    end
    scores.each { |a| total_score+=a }
    total_score
  end
end
