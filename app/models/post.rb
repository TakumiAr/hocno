class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  enum status: { 迷い中: 0, 購入: 1, 断念: 2 }
  mount_uploader :image, ImageUploader
  has_many :notices, dependent: :destroy

  def create_notice_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notice.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id,
                        user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notice = current_user.active_notices.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notice.visitor_id == notice.visited_id
        notice.checked = true
      end
      notice.save if notice.valid?
    end
  end

  def create_notice_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notice_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notice_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notice_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notice = current_user.active_notices.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notice.visitor_id == notice.visited_id
      notice.checked = true
    end
    notice.save if notice.valid?
  end
end
