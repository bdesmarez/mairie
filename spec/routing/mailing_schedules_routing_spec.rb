require "rails_helper"

RSpec.describe MailingSchedulesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mailing_schedules").to route_to("mailing_schedules#index")
    end

    it "routes to #new" do
      expect(:get => "/mailing_schedules/new").to route_to("mailing_schedules#new")
    end

    it "routes to #show" do
      expect(:get => "/mailing_schedules/1").to route_to("mailing_schedules#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mailing_schedules/1/edit").to route_to("mailing_schedules#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mailing_schedules").to route_to("mailing_schedules#create")
    end

    it "routes to #update" do
      expect(:put => "/mailing_schedules/1").to route_to("mailing_schedules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mailing_schedules/1").to route_to("mailing_schedules#destroy", :id => "1")
    end

  end
end
