class VoteSummaryUpdater
  def call(event)
    vote_count = VoteCount.find_or_initialize_by(event_id: event.data[:event_id])
    if event.is_a?(EventUpvoted)
      vote_count.increment!(:upvotes)
    elsif event.is_a?(EventDownvoted)
      vote_count.increment!(:downvotes)
    end
  end
end
