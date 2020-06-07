class User < ApplicationRecord
	validates :name,:email, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#validates :name,length: {minimum: 2,maximum:150}
	validates :email,length: {maximum:250, message: "max is 250 characters"}
	validates :email,format: {with: VALID_EMAIL_REGEX}
	validate :check_length_name, if: ->{name.present?}
	has_secure_password
	def check_length_name
		if name.size >150
			errors.add :name,"Length maximum is 150 characters"
		end
		if name.size < 2
			errors.add :name,"Length minimum is 2 characters"
		end
	end
end
