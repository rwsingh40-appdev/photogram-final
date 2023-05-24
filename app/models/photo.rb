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
  belongs_to :owner, { :class_name => "User" }
  has_many :comments, { :dependent => :destroy }
  has_many :likes, { :dependent => :destroy }

  validates :owner_id, { :presence => true }
  validates :image, { :presence => true }

  mount_uploader :image, ImageUploader
end
