require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:attender) { User.create(name: "Test1", email: "test1@gmail.com",password: "zzzzzz", password_confirmation:"zzzzzz", role:1) }
  let(:organizer) { User.create(name: "Organizer singh", email: "org@gmail.com",password: "zzzzzz", password_confirmation:"zzzzzz", role:0) }
  let(:event) { Event.create(title: "Sample event", description: "A event description") }
  let(:user) { User.create(name: "Organizer singh", email: "org@gmail.com",password: "zzzzzz", password_confirmation:"zzzzzz", role:0) }

  # describe "UsersController#index" do
  #   it "renders the attender_dashboard template" do
  #     sign_in(user)
  #     get :index
  #     expect(response).to have_http_status(:ok)
  #   end
  # end  

  # describe "UsersController#show" do
  #   it "renders the show template" do
  #     get :show, params: { id: user.id }
  #     expect(response).to have_http_status("200")
  #   end
  # end


  
end