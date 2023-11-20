class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :photos, foreign_key: "owner_id", dependent: :destroy
  has_many  :comments, foreign_key: "author_id", dependent: :destroy
  has_many  :likes, foreign_key: "fan_id", dependent: :destroy
  has_many  :follow_sent, class_name: "FollowRequest", foreign_key: "sender_id", dependent: :destroy
  has_many  :follow_received, class_name: "FollowRequest", foreign_key: "recipient_id", dependent: :destroy
end
