require 'csv'

class Importer
  def self.import(from_filename)
    CSV.foreach(from_filename, headers: true) do |row_hash|
      import_score(row_hash)
    end
  end

  def self.import_score(row_hash)
    score = Score.create(
      answer_id: row_hash["answer_id"].to_i,
      breed_id: row_hash["breed_id"].to_i,
      score: row_hash["score"].to_i,
    )
  end
end