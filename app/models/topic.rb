class Topic < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :group
  belongs_to :user
  has_many :comments
  has_many :votes
  has_many :voters, through: :votes, source: :user

  scope :date_descending, -> { order(created_at: :desc) }
  scope :date_ascending, -> { order(created_at: :asc) }
  scope :comments_descending, -> { left_outer_joins(:comments).group('topics.title').order('count(comments.content) desc') }
  scope :comments_ascending, -> { left_outer_joins(:comments).group('topics.title').order('count(comments.content) asc') }
  def preview
    content.length > 150 ? content[0, 150] + "..." : content
  end

  def voteAmount
    self.votes.reduce(0) { |memo, vote| memo + vote.value }
  end
end
