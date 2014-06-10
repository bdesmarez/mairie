require 'rails_helper'

RSpec.describe "MailingSchedules", :type => :request do
  describe "GET /mailing_schedules" do
    it "works! (now write some real specs)" do
      get mailing_schedules_path
      expect(response.status).to be(200)
    end
  end
end
