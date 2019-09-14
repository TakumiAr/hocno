class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  enum status: { 迷い中: 0, 購入: 1, 断念: 2 }
  mount_uploader :image, ImageUploader
end
