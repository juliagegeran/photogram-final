# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :string
#  comments_count :string
#  image          :string
#  likes_count    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  validates(:onwer, presence: true)
  has_many  :comments, dependent: :destroy
  has_many  :likes, dependent: :destroy
  belongs_to :owner, class_name: "User"
  mount_uploader :image, ImageUploader
end
