require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:attender) { User.create(name: "Test1", email: "test1@gmail.com",password: "zzzzzz", password_confirmation:"zzzzzz", role:1) }
  let(:organizer) { User.create(name: "Organizer singh", email: "org@gmail.com",password: "zzzzzz", password_confirmation:"zzzzzz", role:0) }
  let(:event) { Event.create(title: "Birthday", description: "Happy birthday", organizer_id: organizer.id) }
  let(:ticket) { Ticket.create(name:"b101", price:1000, event_id:event.id, attender_id:attender.id, status:"booked", user_id:attender.id) }
  let!(:booked_ticket) { Ticket.create(name:"b101", price:1000, event_id:event.id, attender_id:attender.id, status:"booked", user_id:attender.id) }
  let!(:unbooked_ticket) { Ticket.create(name:"b101", price:1000, event_id:event.id, attender_id:attender.id, status:"not-booked", user_id:attender.id) }

  describe "TicketsController#show" do
    it "renders the tickets show template" do
      get :show, params: { event_id: event.id }
      expect(assigns(:event)).to eq(event)
      expect(assigns(:ticket)).to match_array([booked_ticket, unbooked_ticket])
      expect(assigns(:booked)).to eq(1) 
      expect(assigns(:unbooked)).to eq(1)  
      expect(response).to render_template("show")
    end
  end


  describe "TicketsController#download_pdf" do
    context "Ticket pdf download" do
      it "renders the show template" do
      sign_in(attender)
      ticket = Ticket.create(name:"b101", price:1000, event_id:event.id, attender_id:attender.id, status:"booked", user_id:attender.id)
        get :download_pdf, params: {id: ticket.id }
        expect(response).to have_http_status("200")
      end
    end
  end



  describe "TicketsController#index" do
  context "User can create ticket for event" do
    it "renders the show template" do
      sign_in(organizer)
      post :create, params: { ticket: { name: "b101", price: 2500, user_id: organizer.id } }
      expect(response).to have_http_status("302")
    end
  end
end


  describe "TicketsController#book" do
    it "renders the show template" do
      sign_in(attender)
      ticket = Ticket.create(name:"b101", price:1000, event_id:event.id, attender_id:attender.id, status:"booked", user_id:attender.id)
      post :book, params: { id: ticket.id }
      expect(assigns(:ticket)).to eq(ticket)
      expect(response).to have_http_status("204")
  end

  it "does not book when already booked" do
    ticket = Ticket.create(name:"b101", price:1000, event_id:event.id, attender_id:attender.id, status:"booked", user_id:attender.id)
    post :book, params: { id: ticket.id }
    expect(assigns(:ticket)).to eq(ticket)
    # expect(flash[:error]).to eq("Ticket record not found.")
    expect(response).to have_http_status("204")
end
  
end
end