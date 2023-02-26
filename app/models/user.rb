class User < ApplicationRecord
  belongs_to :country

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :points, presence: true, 
                     numericality: { 
                      only_integer: true, 
                      greater_than_or_equal_to: 150, 
                      less_than_or_equal_to: 1_000_000 
                    }
end
