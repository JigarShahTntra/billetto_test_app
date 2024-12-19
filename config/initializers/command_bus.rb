Rails.application.config.to_prepare do
  Rails.configuration.command_bus = CommandBus.new.tap do |bus|
    bus.register(UpvoteEvent, VotingService.new)
    bus.register(DownvoteEvent, VotingService.new)
  end
end
