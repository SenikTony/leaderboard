# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Regions

Region.create(ApplicationRecord::REGIONS.map { |name| {name: name} })

europe = Region.find_by(name: "Europe")
Country.create(ApplicationRecord::EUROPE_COUNTRIES.map { |name| { region: europe, name: name } })

asia = Region.find_by(name: "Asia")
Country.create(ApplicationRecord::ASIA_COUNTRIES.map { |name| { region: asia, name: name } })

country_ids = Country.ids
100_000.times do
  CreateNewRandomUserJob.perform_async(country_ids.sample)
end

