class PostsController < ApplicationController
  def index
    @posts = Post.includes(:account, :comments, :votes).map { |post| PostListItem.new(post) }
  end
end
