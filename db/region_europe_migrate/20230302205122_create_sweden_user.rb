class CreateSwedenUser < ActiveRecord::Migration[7.0]
  def change
    create_table :sweden_users do |t|
      t.integer :country_id, index: true, null: false
      t.string :name, null: false, index: { unique: true }, default: "New user"
      t.integer :points, null: false, default: 150

      t.timestamps
    end
  end
end
