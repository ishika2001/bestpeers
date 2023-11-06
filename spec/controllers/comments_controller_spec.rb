require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { User.create(name: "Organizer singh", email: "org@gmail.com",password: "zzzzzz", password_confirmation:"zzzzzz", role:0) }
  let(:organizer) { User.create(name: "Organizer singh", email: "org@gmail.com",password: "zzzzzz", password_confirmation:"zzzzzz", role:0) }
  let(:attender) { User.create(name: "Test1", email: "test1@gmail.com",password: "zzzzzz", password_confirmation:"zzzzzz", role:1) }
  let(:event) { Event.create(title: "Sample event", description: "A event description", organizer_id: user.id) }
  let(:comment) { Comment.create(description: "A event description", event_id:event.id, attender_id:attender.id) }

  describe "CommentsController#index" do
    it "renders the index template" do
      get :show, params: { id: event.id }
      expect(response).to have_http_status("200")
    end
  end

  # describe "CommentsController#create" do
  #   it "renders the unprocessble_entity template" do
  #     sign_in(attender)
  #     byebug
  #     post :create, params: { comment: { event_id:event.id, attender_id: attender.id  }}
  #     expect(response).to have_http_status("200")
  #   end
  # end

  describe "CommentsController#index" do
    context "attender can add comment to event" do
      it "renders the show template" do
        sign_in(attender)
        
        post  :create, params: {event_id: event.id, comment: { description: "Description", attender_id: attender.id, event_id: event.id } }
        expect(response).to have_http_status("302")
      end
    end
  end

  describe "CommentsController#destroy" do
    context "User can destroy comment" do
      it "renders the show template" do
        sign_in(attender)
        delete :destroy, params: { id: comment.id, event_id:event.id }
        expect(response).to have_http_status("302")
      end
    end
  end
end
