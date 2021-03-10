class Invitation < ApplicationRecord
  belongs_to :attendee, foreign_key: "attendee_id", class_name: "User"
  belongs_to :event
end
