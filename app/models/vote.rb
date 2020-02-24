class Vote < ApplicationRecord
  belongs_to :vote_container
  belongs_to :topic

  def self.find_by_vote_container_and_topic(vote_container, topic)
    where('vote_container_id = ? and topic_id = ?', vote_container.id, topic.id).first
  end
end
