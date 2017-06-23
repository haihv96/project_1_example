class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {maximum: 255}
  validates :context, presence: true

  scope :feed_by_user, ->(following_ids, user_id) do
    where("user_id in (#{following_ids.join(",")}) OR user_id = #{user_id}")
      .order(created_at: :desc)
  end

  scope :linetime, -> (id) {order created_at: :desc}

  def comments_timeline
    Comment.timeline id
  end
end
