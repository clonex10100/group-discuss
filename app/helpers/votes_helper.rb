module VotesHelper
  def render_vote(vote)
    vote_vals = {1 => 'liked', -1 => 'disliked'}
    if vote.value != 0
      message = "You #{vote_vals[vote.value]} this post. Change Your Vote Below:"
    else
      message = "Vote Now"
    end
    content = content_tag(:h3, message)
    content << render(partial: 'votes/form', locals: {vote: vote})
    content
  end
end
