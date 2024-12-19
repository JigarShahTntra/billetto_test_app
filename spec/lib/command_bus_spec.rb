require 'rails_helper'

RSpec.describe CommandBus do
  let(:bus) { CommandBus.new }
  let(:handler) { double(:handler, call: true) }

  before do
    bus.register(UpvoteEvent, handler)
  end

  it 'routes the command to the correct handler' do
    command = UpvoteEvent.new(event_id: 1, user_id: 123)
    expect(handler).to receive(:call).with(command)
    bus.call(command)
  end

  it 'raises an error for unregistered commands' do
    command = DownvoteEvent.new(event_id: 1, user_id: 123)
    expect { bus.call(command) }.to raise_error("Handler not found for DownvoteEvent")
  end
end
