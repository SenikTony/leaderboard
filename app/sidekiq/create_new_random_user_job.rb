class CreateNewRandomUserJob
  include Sidekiq::Job

  def perform(country_id)
    country = Country.find(country_id)
    user_klass = Factories::UserOfCountry.getting_class(country)

    user = user_klass.new
    user.name = "#{FFaker::Internet.user_name}_#{DateTime.current.to_i}"
    user.points = Random.rand(150..1_000_000)
    user.save
  end
end
