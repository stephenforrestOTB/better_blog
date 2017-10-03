require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  render_views
  let!(:post) {Post.create(title: "a title", body: "the body") }

  describe 'GET #show' do
    it "should show a post" do
      get :show
      expect(response.body).to include("my post")
    end
  end

  describe 'GET #index' do
    it 'should show all posts' do
      get :index
      expect(response.body).to include("the body")

    end
  end

  describe 'GET #new' do
    it 'should show a form for a new post' do
      get :new

      expect(response.body).to include("Create Post")
    end
  end
end
