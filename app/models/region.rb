class Region < ApplicationRecord
  has_many :countries, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def name_alias
    name.parameterize(separator: "_")
  end
end
