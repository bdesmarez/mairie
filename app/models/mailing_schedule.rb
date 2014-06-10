class MailingSchedule < ActiveRecord::Base
  belongs_to :template
  belongs_to :city_hall
end
