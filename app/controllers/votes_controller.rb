class VotesController < ApplicationController
  def upvote
    me = Account.first
    post = Post.find(params[:id])
    vote = Vote.new(post: post, account: me, vote: "upvote")
    respond_to do |format|
      format.js do
        if vote.save
          render 'disable_voting'
        else
          render 'error_saving_upvote'
      end
    end
  end

  def downvote
    respond_to do |format|
      format.js
    end
  end
end
