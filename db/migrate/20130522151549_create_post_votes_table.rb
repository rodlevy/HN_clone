class CreatePostVotesTable < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :upvoted, :default => false
      t.timestamps
    end
  end
end
