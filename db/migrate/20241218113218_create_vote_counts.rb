class CreateVoteCounts < ActiveRecord::Migration[7.2]
  def change
    create_table :vote_counts do |t|
      t.integer :event_id
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
