# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  validates(:owner, presence: true)
  validates(:image, presence: true)
  validates(:caption, presence: true)
  has_many  :comments, dependent: :destroy
  has_many  :likes, dependent: :destroy
  belongs_to :owner, class_name: "User"
  mount_uploader :image, ImageUploader
end
