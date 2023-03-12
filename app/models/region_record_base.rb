class RegionRecordBase < ActiveRecord::Base
  self.abstract_class = true

  def self.country_user_tables
    @country_user_tables ||= connection.tables.filter do |t_name|
      t_name.include?("users")
    end
  end
end
