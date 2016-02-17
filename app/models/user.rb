class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :first_name, :last_name, :email_address, :password, presence: true, length: { in: 2..20 }
	before_save do
		self.email.downcase!
	end
end
