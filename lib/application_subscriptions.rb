module ApplicationSubscriptions
  def self.configure_event_store(event_store)
    event_store.subscribe(VoteSummaryUpdater.new, to: [ EventUpvoted, EventDownvoted ])
  end
end
