class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  REGIONS = %w[Asia Europe].freeze
  EUROPE_COUNTRIES = %w[France Spain Sweden Germany Finland].freeze
  ASIA_COUNTRIES = %w[China Indonesia Bangladesh Philippines Turkey].freeze

  connects_to database: { writing: :primary }
end
