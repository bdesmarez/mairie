class CityHall < ActiveRecord::Base

	# Validators
	validates :city, presence: true
	validates :postalCode, presence: true
	validates :logo, :attachment_presence => true

	validates_format_of :postalCode,
                  with: /\A[0-9]{5}\z/,
                  message: "should be 12345",
                  allow_blank: true


	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/



end
