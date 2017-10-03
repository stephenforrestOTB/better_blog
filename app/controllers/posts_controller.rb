class PostsController < ApplicationController

  def show
    render plain: "my post"
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

end
