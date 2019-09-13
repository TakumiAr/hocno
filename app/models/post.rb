class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum status: { 迷い中: 0, 購入: 1, 断念: 2 }
  mount_uploader :image, ImageUploader
end
