class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :context, presence: true

  scope :order_time, -> {order(created_at: :desc)}

  scope :timeline, ->(post_id) do
    where("post_id = ?", post_id).order_time
  end

  scope :load_comments, ->(id_comment_continue, number) do
    if id_comment_continue.present?
      where("id <= #{id_comment_continue}").limit(number).order_time
    end
  end
end
