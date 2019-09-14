class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes
  has_many :like_users, through: :likes, source: :user
  enum status: { 迷い中: 0, 購入: 1, 断念: 2 }
  mount_uploader :image, ImageUploader
end
