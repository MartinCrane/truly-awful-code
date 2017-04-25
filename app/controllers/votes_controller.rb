class VotesController < ApplicationController
  before_action :authenticate
  def upvote
    @post = Post.find(params[:id])
    vote = @post.votes.new(account: current_account, vote: "upvote")
    if vote.save
      redirect_to root_path, notice: "Your upvote has been registered"
    else
      existing_vote = @post.votes.find_by(account: current_account)
      if existing_vote.vote == "upvote"
        existing_vote.destroy
        redirect_to root_path, notice: "We've Removed your upvote"
      else
        existing_vote.destroy
        @post.votes.create(account: current_account, vote: "upvote")
        redirect_to root_path, notice: "Your upvote has been registered"
      end
    end
  end

  def downvote
    @post = Post.find(params[:id])
    vote = @post.votes.new(account: current_account, vote: "downvote")
    if vote.save
      redirect_to root_path, notice: "Your downvote has been registered"
    else
      existing_vote = @post.votes.find_by(account: current_account)
      if existing_vote.vote == "downvote"
        existing_vote.destroy
        redirect_to root_path, notice: "We've Removed your downvote"
      else
        existing_vote.destroy
        @post.votes.create(account: current_account, vote: "downvote")
        redirect_to root_path, notice: "Your downvote has been registered"
      end
    end
  end
end
