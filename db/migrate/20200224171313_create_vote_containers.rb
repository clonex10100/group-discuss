class CreateVoteContainers < ActiveRecord::Migration[6.0]
  def change
    create_table :vote_containers do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
