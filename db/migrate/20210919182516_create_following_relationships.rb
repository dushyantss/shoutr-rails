class CreateFollowingRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :following_relationships do |t|
      t.belongs_to :follower, null: false, foreign_key: {to_table: :users}
      t.references :followed_user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end

    add_index :following_relationships, [:follower_id, :followed_user_id], unique: true, name: "idx_following_relationships_on_fid_and_fuid"
  end
end
