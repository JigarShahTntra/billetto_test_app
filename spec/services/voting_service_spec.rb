require 'rails_helper'

RSpec.describe VotingService, type: :service do
  let(:event_store) { Rails.configuration.event_store }

  it 'publishes an EventUpvoted event' do
    command = UpvoteEvent.new(event_id: 1, user_id: 123)

    expect(event_store).to receive(:publish).with(
      instance_of(EventUpvoted)
    )

    VotingService.new.call(command)
  end

  it 'publishes an EventDownvoted event' do
    command = DownvoteEvent.new(event_id: 1, user_id: 123)

    expect(event_store).to receive(:publish).with(
      instance_of(EventDownvoted)
    )

    VotingService.new.call(command)
  end
end
