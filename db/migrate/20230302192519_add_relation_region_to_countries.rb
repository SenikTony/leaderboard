class AddRelationRegionToCountries < ActiveRecord::Migration[7.0]
  def change
    add_reference :countries, :region, foreign_key: true
  end
end
