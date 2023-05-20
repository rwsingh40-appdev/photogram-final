# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  photo_id   :integer
#
class Like < ApplicationRecord
  belongs_to :fan, { :class_name => "User", :counter_cache => true }
  belongs_to :photo, { :counter_cache => true }

  validates :photo_id, { :presence => true }
  validates :fan_id, { :presence => true }
end
