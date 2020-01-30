class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.text :text
      t.string :address
      t.string :phone
      t.string :time
      t.string :price
      t.string :gurunai
      t.timestamps
    end
  end
end
