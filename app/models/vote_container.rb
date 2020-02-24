class VoteContainer < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :topics, through: :votes
end
