require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with a title and a description" do
    user= User.create(name: "Organizer singh", email: "org@gmail.com",password: "zzzzzz", password_confirmation:"zzzzzz", role:0)
    event = Event.new(title: "birthday", description: "Abab", organizer_id:user.id)
    expect(event).to be_valid
  end

  it "is not valid without a title" do
    event = Event.new(description: "A event description")
    expect(event).to_not be_valid
  end

  it "is not valid without a description" do
    event = Event.new(title: "Sample event")
    expect(event).to_not be_valid
  end

  it "has many tickets" do
    event = Event.reflect_on_association(:tickets)
    expect(event.macro).to eq(:has_many)
  end

  # it "belongs to a user" do
  #   event = Event.reflect_on_association(:user)
  #   expect(event.macro).to eq(:belongs_to)
  # end
end