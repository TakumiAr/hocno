class Post < ApplicationRecord
  enum status: { 迷い中: 0, 購入: 1, 断念: 2 }
end
