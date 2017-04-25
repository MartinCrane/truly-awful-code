class PostListItem < SimpleDelegator
  def vote_status(account)
    if  self.votes.find_by(account: account, vote: "upvote")
      :upvote
    elsif self.votes.find_by(account: account, vote: ":downvote")
      :downvote
    else
      :no_vote
    end
  end

  def comment_status(context)
    case comments.count
    when 0
      context.content_tag('p', "No Comments... yet")
    when 1..10
      context.content_tag('p', "#{comments.count} Comments so far!")
    when 10..BigDecimal::INFINITY
      context.content_tag('p', "#{comments.count} COMMENTS?!")
    end
  end

  def upvote_button(account, context)
    context.content_tag("div") do
      context.link_to context.upvote_post_path(self), method: :post do
        if vote_status(account) == :upvote
          context.content_tag("i", "You Upvoted", class: "glyphicon glyphicon-ok")
        else
          context.content_tag("i", nil, class: "glyphicon glyphicon-ok")
        end
      end
    end
  end

  def downvote_button(account, context)
    context.content_tag("div") do
      context.link_to context.downvote_post_path(self), method: :post do
        if vote_status(account) == :downvote
          context.content_tag("i", "You Downvoted", class: "glyphicon glyphicon-remove")
        else
          context.content_tag("i", nil, class: "glyphicon glyphicon-remove")
        end
      end
    end
  end
end
