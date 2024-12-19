require 'rails_helper'

RSpec.describe VoteCount, type: :model do
  it { should validate_presence_of(:event_id) }

  it 'initializes with zero upvotes and downvotes' do
    vote_count = VoteCount.create(event_id: 1)
    expect(vote_count.upvotes.to_i).to eq(0)
    expect(vote_count.downvotes.to_i).to eq(0)
  end

  it 'rejects a votecount without an event' do
    vote_count = VoteCount.create()
    expect(vote_count).to_not be_valid
    expect(vote_count.errors[:event]).to include("must exist")
  end
end
