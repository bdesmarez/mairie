class CreateCityHalls < ActiveRecord::Migration
  def change
    create_table :city_halls do |t|
      t.string :name
      t.string :city
      t.integer :postalCode

      t.timestamps
    end
  end
end
