class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  def self.find_by_user_and_topic(user, topic)
    where('user_id = ? and topic_id = ?', user.id, topic.id).first
  end
end
