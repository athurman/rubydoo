namespace :import do
  task :from_api => :environment do
    PetFinder.retrieve_shelters("TN")
  end

end