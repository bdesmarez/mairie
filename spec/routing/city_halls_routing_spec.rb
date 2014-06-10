require "spec_helper"

describe CityHallsController do
  describe "routing" do

    it "routes to #index" do
      get("/city_halls").should route_to("city_halls#index")
    end

    it "routes to #new" do
      get("/city_halls/new").should route_to("city_halls#new")
    end

    it "routes to #show" do
      get("/city_halls/1").should route_to("city_halls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/city_halls/1/edit").should route_to("city_halls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/city_halls").should route_to("city_halls#create")
    end

    it "routes to #update" do
      put("/city_halls/1").should route_to("city_halls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/city_halls/1").should route_to("city_halls#destroy", :id => "1")
    end

  end
end
