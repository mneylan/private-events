class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  
  has_many :invitations, foreign_key: "attendee_id"
  has_many :attended_events, through: :invitations, foreign_key: "event_id", source: :event
end
