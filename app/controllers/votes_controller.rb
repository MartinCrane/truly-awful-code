class VotesController < ApplicationController
  before_action :authenticate
  def upvote
    @post = Post.find(params[:id])
    vote = @post.votes.create(account: current_account, vote: "upvote")
    respond_to do |format|
      format.js do
        if vote.save
          render 'disable_voting'
        else
          render 'error_saving_upvote'
        end
      end
    end
  end

  def downvote
    @post = Post.find(params[:id])
    vote = @post.votes.create(account: current_account, vote: "downvote")
    respond_to do |format|
      format.js do
        if vote.save
          render 'disable_voting'
        else
          render 'error_saving_upvote'
        end
      end
    end
  end
end
