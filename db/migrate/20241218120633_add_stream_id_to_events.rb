class AddStreamIdToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :stream_id, :string
  end
end
