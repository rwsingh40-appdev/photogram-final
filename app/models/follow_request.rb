# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FollowRequest < ApplicationRecord
  belongs_to :recipient, { :class_name => "User" }
  belongs_to :sender, { :class_name => "User" }

  validates :status, { :presence => true }
  validates :sender_id, { :presence => true }
  validates :recipient_id, { :presence => true }

  scope :accepted_request, -> { where :status => "accepted" }
end
