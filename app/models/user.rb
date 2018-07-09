class User < ApplicationRecord
  has_many :recipes
  has_many :bookmarks
  has_many :followers, -> { order("follows.id DESC") }, class_name: "Follow", foreign_key: :followee_id
  has_many :followees, -> { order("follows.id DESC") }, class_name: "Follow", foreign_key: :follower_id
end
