module Factories
  class UserOfCountry
    class UnknownCountryUserError < StandardError
      attr_reader :country_name

      def initialize(country_name)
        super
        @country_name = country_name
      end

      def message
        "Unknown table name '#{country_name}_users'"
      end
    end

    class << self
      def getting_class(country)
        table_name = define_table_name(country)
        class_name = table_name.gsub(/ |-/, "_").classify
        return class_name.constantize if Object.const_defined?(class_name)

        create_class(class_name, abstract_record_class(country.region.name)) do
          self.table_name = table_name
          self.primary_key = "id"

          belongs_to :country, class_name: "Country"

          validates :name, presence: true, uniqueness: { case_sensitive: false }
          validates :points, presence: true,
                             numericality: {
                               only_integer: true,
                               greater_than_or_equal_to: 150,
                               less_than_or_equal_to: 1_000_000
                             }

          after_initialize { default_country_settings }
          before_save { default_country_settings }

          scope :country_rating, -> { order(points: :desc).limit(100) }

          def country_id
            country_by_model_name.id
          end

          private

          def country_by_model_name
            @country_by_model_name ||= Country.find_by(name: country_name)
          end

          def country_name
            self.class.name.delete_suffix("User")
          end

          def default_country_settings
            self.country_id = country_id
            self.country = country_by_model_name
          end
        end
      end

      private

      def create_class(class_name, superclass, &)
        klass = Class.new(superclass, &)
        Object.const_set class_name, klass
      end

      def abstract_record_class(region_name)
        "#{region_name.humanize}Record".classify.constantize
      end

      def define_table_name(country)
        name = "#{country.name_alias}_users"

        return name if abstract_record_class(country.region.name)
          .country_user_tables
          .include?("#{country.name_alias}_users")

        raise UnknownCountryUserError, country.name_alias
      end
    end
  end
end
