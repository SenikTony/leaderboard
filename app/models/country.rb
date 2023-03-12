class Country < ApplicationRecord
  belongs_to :region

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_destroy { users.destroy_all }

  def self.collection_with_global
    order(:name).pluck(:id, :name).unshift([-1, "Global"])
  end

  def name_alias
    name.parameterize(separator: "_")
  end

  def users
    Factories::UserOfCountry.getting_class(self).all
  end
end
