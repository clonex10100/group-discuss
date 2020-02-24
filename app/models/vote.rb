class Vote < ApplicationRecord
  belongs_to :vote_container
  belongs_to :topic
end
