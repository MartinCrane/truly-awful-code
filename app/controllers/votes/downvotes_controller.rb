class Votes::DownvotesController < VotesController
  def create
    post = Post.find(params[:id])
    case VoteRegistration.call(post, current_account, "downvote")
    when :vote_registered
      redirect_to root_path, notice: "Your downvote has been registered"
    when :vote_removed
      redirect_to root_path, notice: "We've Removed your downvote"
    end
  end
end
