class LeaderBoard
  attr_reader :country_id

  def initialize(country_id)
    @country_id = country_id
  end

  def rating
    global? ? global_rating : country_rating
  end

  def country_rating
    return [] unless country

    user_klass.country_rating
  end

  def global_rating
    []
  end

  private

  def global?
    country_id.present? && country_id.to_i <= 0
  end

  def country
    @country ||= Country.find_by(id: country_id)
  end

  def user_klass
    @user_klass ||= Factories::UserOfCountry.getting_class(country)
  end
end
