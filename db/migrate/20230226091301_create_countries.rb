class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name, null: false, index: { unique: true }, default: "New country"
      t.timestamps
    end
  end
end
