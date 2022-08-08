class User < ApplicationRecord
  include Clearance::User

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, class_name: "Tweet"
end
