require 'rails_helper'

describe Product do
  before do
    @product = Product.create!(name: "race bike")
    @user = User.create(first_name: "BDD", last_name: "Test", email: "test@test.com", password: "JINGLE")
    @product.comments.create!(rating: 1, user: @user, body: "Horrible bike")
    @product.comments.create!(rating: 3, user: @user, body: "Terrible")
    @product.comments.create!(rating: 5, user: @user, body: "It was nice")
  end

  it "returns the average rating of the comments" do
    expect(@product.average_rating).to eq 3
  end

  it "shouldn't create product becasue missing name" do
    expect(Product.new(description: "Great bike")).to_not be_valid
  end

end