class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy

  has_many :active_notices, class_name: 'Notice', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notices, class_name: 'Notice', foreign_key: 'visited_id', dependent: :destroy
end
