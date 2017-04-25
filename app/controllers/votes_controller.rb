class VotesController < ApplicationController
  before_action :authenticate
  def upvote
    post = Post.find(params[:id])
    case VoteRegistration.call(post, current_account, "upvote")
    when :vote_registered
      redirect_to root_path, notice: "Your upvote has been registered"
    when :vote_removed
      redirect_to root_path, notice: "We've Removed your upvote"
    end
  end

  def downvote
    post = Post.find(params[:id])
    case VoteRegistration.call(post, current_account, "downvote")
    when :vote_registered
      redirect_to root_path, notice: "Your downvote has been registered"
    when :vote_removed
      redirect_to root_path, notice: "We've Removed your downvote"
    end
  end
end
