Rails.application.config.to_prepare do
  event_store = RailsEventStore::Client.new
  ApplicationSubscriptions.configure_event_store(event_store)
  Rails.configuration.event_store = event_store
end
