class MailingSchedule < ActiveRecord::Base
  belongs_to :template
  belongs_to :city_hall

  validates :template, presence: true
	validates :city_hall, presence: true
	validates :name, presence: true

  has_attached_file :snapshot, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :snapshot, :content_type => /\Aimage\/.*\Z/
	
end
