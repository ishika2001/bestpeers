require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is not valid without a description" do
    comment = Comment.create(description: "A event description")
    expect(comment).to_not be_valid
  end
end
