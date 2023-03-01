class Country < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.collection_with_global
    order(:name).pluck(:id, :name).unshift([-1, "Global"])
  end
end
