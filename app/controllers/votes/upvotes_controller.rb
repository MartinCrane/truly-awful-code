class Votes::UpvotesController < VotesController
  def create
    post = Post.find(params[:id])
    case VoteRegistration.call(post, current_account, "upvote")
    when :vote_registered
      redirect_to root_path, notice: "Your upvote has been registered"
    when :vote_removed
      redirect_to root_path, notice: "We've Removed your upvote"
    end
  end
end
