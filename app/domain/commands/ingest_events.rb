class IngestEvents
  def call
    service = BillettoApiService.new
    events = service.fetch_events

    events.each do |event_data|
      Event.find_or_create_by!(
        title: event_data["title"],
        description: event_data["description"],
        date: DateTime.parse(event_data["enddate"]),
        image_url: event_data["image_link"]
      )
    end

    # Publish an event to signal ingestion
    Rails.configuration.event_store.publish(
      EventsFetched.new(data: { count: events.size }),
      stream_name: "EventsFetched"
    )
  end
end
