class User < ActiveRecord::Base

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :social_security_number, presence: true
	EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates :email, uniqueness: true, length: { maximum: 254 },format: { with: EMAIL_REGEX }
	validates :social_security_number, uniqueness: true, length: { minimum: 9, maximum: 9 }
	
	def info
		return { first_name: self.first_name, last_name: self.last_name, email: self.email }
	end

end
