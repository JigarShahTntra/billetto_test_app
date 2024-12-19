require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:date) }

  it 'creates a valid event' do
    event = Event.new(title: 'Sample Event', description: 'Event Description', date: Time.now, image_url: "https://xyz.image")
    expect(event).to be_valid
  end

  it 'rejects an event without a title' do
    event = Event.new(description: 'Event Description', date: Time.now)
    expect(event).to_not be_valid
    expect(event.errors[:title]).to include("can't be blank")
  end
end
