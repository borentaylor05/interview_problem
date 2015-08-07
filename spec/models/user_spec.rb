require 'rails_helper'

RSpec.describe User, type: :model do
  
	before { @user = User.new(first_name: "taylor", last_name: "boren", email: "taylorboren@example.com", social_security_number: 222222222) }

	it "should not accept nil first_name" do 
		@user.first_name = nil
		expect(@user).to_not be_valid
	end

	it "should not accept nil last_name" do 
		@user.last_name = nil
		expect(@user).to_not be_valid
	end

	it "should not accept nil email" do 
		@user.email = nil
		expect(@user).to_not be_valid
	end

	it "should not accept nil social_security_number" do 
		@user.social_security_number = nil
		expect(@user).to_not be_valid
	end

	# I decided it was best to only accept hyphens on the front end so that the 
	# DB is consistent and saves space by saving SSN as int, not strings
	# Potential hyphens will be stripped out in before_save method
	it "should not accept social_security_number != 9 numbers" do 
		[88888888, 1010101010, nil, 0, 1234567890, '000-00-0000' ].each do |ss|
			@user.social_security_number = ss 
			expect(@user).to_not be_valid, "Invalid SS => #{ss}"
		end
	end

	it "should not accept invalid email" do 		
		%w[ @example.com invalidemail invalidemail@me email.example.com email@example@example.com #@%^%#$@#$@#.com].each do |email|
			@user.email = email 
			expect(@user).to_not be_valid
		end
	end

	it "should not accept duplicate emails" do 
		@user.save
		newUser = User.new(first_name: "taylor", last_name: "boren", email: "taylorboren@example.com", social_security_number: 111111111)
		expect(newUser).to_not be_valid 
	end

	it "should not accept duplicate social_security_numbers" do 
		@user.save
		newUser = User.new(first_name: "taylor", last_name: "boren", email: "newme@example.com", social_security_number: 222222222)
		expect(newUser).to_not be_valid 
	end

	it "should accept valid emails" do 
		%w[ taylorboren@example.com me@example.net you@msn.au example@foo.com ].each do |email|
			@user.email = email 
			expect(@user).to be_valid
		end
	end

	it "should accept valid user" do 
		expect(@user).to be_valid
	end

end
