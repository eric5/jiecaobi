class AddIndexToReputations < ActiveRecord::Migration
  def change
    add_index :reputations, [:sender_id, :created_at]
  end
end
