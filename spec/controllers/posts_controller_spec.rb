require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  render_views
  let!(:valid_post) {Post.create(title: "a title", body: "the body") }
  let!(:changeme_post) {Post.create(title: "change the title", body: "or the body") }

  describe 'GET #show' do
    it "should show a post" do
      get :show, params: { id: valid_post.id}
      expect(response.body).to include("the body")
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

  describe 'POST #create' do
    it 'should create a new post in the database' do
      post_count_before = Post.count
      post :create, params: {post: {title: "second_title", body: "second body" }}

      expect(Post.count).to eq(post_count_before + 1)
    end
  end

  describe "GET #edit" do
    it "should display the edit form" do
      get :edit, params: { id: changeme_post.id }

      expect(response.body).to include("Update Post")
    end
  end

  describe "PATCH #update" do
    it "should update a post" do
      patch :update, params: {post:{title: "updated_title", body: "updated body" },id: changeme_post.id}

      expect(response).to redirect_to(changeme_post)
    end
  end
end
