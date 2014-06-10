class AddLogoToCityHall < ActiveRecord::Migration
  def self.up
    add_attachment :city_halls, :logo
  end

  def self.down
    remove_attachment :city_halls, :logo
  end
end
