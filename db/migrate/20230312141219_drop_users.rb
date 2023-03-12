class DropUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :users do |t|
      t.references :country, foreign_key: true
      t.string :name, null: false, index: { unique: true }, default: "New user"
      t.integer :points, null: false, default: 150

      t.timestamps
    end
  end
end
