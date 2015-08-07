require 'rails_helper'

RSpec.describe UsersController, type: :controller do

		describe "Users index" do
	    it "gets all users" do      
	      	get :index
	      	expect(response).to be_success
	    end

	    it "renders the index template" do
	      	get :index
	      	expect(response).to render_template("index")
	    end

	    describe "Show User"
	    it "gets all users" do      
	      	get :show, id: User.first.id
	      	expect(response).to be_success
	    end

	    it "creates a user" do 
	    	post :create, user: { email: "me@example.com", first_name: "ADSDA", last_name: "SDASDS", social_security_number: 123456789 }
	    	expect(response).to be_success
	    end

  	end

end
