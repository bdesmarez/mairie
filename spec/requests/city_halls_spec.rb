require 'spec_helper'

describe "CityHalls" do
  describe "GET /city_halls" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get city_halls_path
      response.status.should be(200)
    end
  end
end
