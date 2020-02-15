class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.text :text, null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.string :time
      t.string :price
      t.string :taberogu
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
