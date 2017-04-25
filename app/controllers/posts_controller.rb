class PostsController < ApplicationController
  def index
    @posts = Post.all.map { |post| PostListItem.new(post) }
  end
end
