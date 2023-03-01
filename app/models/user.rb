class User < ApplicationRecord
  belongs_to :country

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :points, presence: true, 
                     numericality: { 
                      only_integer: true, 
                      greater_than_or_equal_to: 150, 
                      less_than_or_equal_to: 1_000_000 
                    }

  scope :global_rating, -> { order(points: :desc).limit(100) }
  scope :country_rating, ->(country_id) { where(country_id: country_id).order(points: :desc).limit(100) }
end
