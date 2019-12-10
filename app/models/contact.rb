class Contact
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend  ActiveModel::Naming

 
  attr_accessor :name, :email, :subject, :message
 
  validates :name, :email, :subject, :message, presence: true
  validates :email, :format => { :with => %r{.+@.+\..+} }, allow_blank: true
 

	def persisted?
  	false
	end
 
	def initialize(attributes = {})
  	attributes.each do |name, value|
    	send("#{name}=", value)
  	end
	end
end