class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :name, null: false, default: "Default region", index: { unique: true }

      t.timestamps
    end
  end
end
