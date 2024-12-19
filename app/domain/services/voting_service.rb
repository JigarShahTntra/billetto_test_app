class VotingService
  def call(command)
    case command
    when UpvoteEvent
      upvote(command)
    when DownvoteEvent
      downvote(command)
    else
      raise "Unknown command: #{command.class}"
    end
  end

  private

  def upvote(command)
    Rails.configuration.event_store.publish(
      EventUpvoted.new(data: { event_id: command.event_id, user_id: command.user_id }),
      stream_name: "Event-#{command.event_id}-Upvoted"
    )
  end

  def downvote(command)
    Rails.configuration.event_store.publish(
      EventDownvoted.new(data: { event_id: command.event_id, user_id: command.user_id }),
      stream_name: "Event-#{command.event_id}-Downvoted"
    )
  end
end
