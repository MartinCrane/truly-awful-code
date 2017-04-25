class VoteRegistration
  attr_reader :post, :account, :vote_intention
  def initialize(post, account, vote_intention)
    @post = post
    @account = account
    @vote_intention = vote_intention
  end

  def call
    vote = post.votes.new(account: account, vote: vote_intention)
    if vote.save
      :vote_registered
    else
      existing_vote = post.votes.find_by(account: account)
      if existing_vote.vote == vote_intention
        existing_vote.destroy
        :vote_removed
      else
        existing_vote.destroy
        post.votes.create(account: account, vote: vote_intention)
        :vote_registered
      end
    end
  end

  def self.call(post, account, vote_intention)
    self.new(post, account, vote_intention).call
  end
end
