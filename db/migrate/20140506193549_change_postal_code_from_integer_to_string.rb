class ChangePostalCodeFromIntegerToString < ActiveRecord::Migration
  def up
  	change_column :city_halls, :postalCode, :string
  end

  def down
  	change_column :city_halls, :postalCode, :integer
  end
end
