class UsersController < ApplicationController

#	before_action :verify, only: [:create]

	def index
		@users = User.all.select(:first_name, :last_name, :email, :id)
	end

	def show 
		@user = User.find_by(id: params[:id])
	end

	def new
	end

	def create
		user = User.new(
			first_name: params[:first_name],
			last_name: params[:last_name],
			email: params[:email],
			social_security_number: params[:social_security_number].gsub!("-", "").to_i
		)
		if user.valid?
			user.save
			respond({ status: 200, user: user.info })
		else
			respond({ status: 400, error: user.errors.full_messages })
		end
	end

end
