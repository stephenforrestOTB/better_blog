require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:valid_post) {Post.new(title: "A Title", body: "A Body")}
  let(:invalid_post) {Post.new(title: nil, body: nil)}

  context "a valid post" do

    it "should be valid" do
      expect(valid_post).to be_valid
    end

    it "should hit the database" do
      valid_post.save
      expect(Post.count).to eq(1)
    end
  end

  context "an invalid post" do
    it "should be invalid" do
      expect(invalid_post).to be_invalid
    end
    it "should not hit the database" do
      invalid_post.save
      expect(Post.count).to eq(0)
    end
  end
end
