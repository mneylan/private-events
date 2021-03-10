class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"
  
  has_many :invitations
  has_many :attendees, through: :invitations, foreign_key: "attendee_id", source: :attendee
  
  
  validates :title, :description, :date, presence: true
  
  scope :past, -> { where('date < ?', Time.now) }
  scope :future, -> { where('date > ?', Time.now) }

end

# def self.past
#   events = []
#    self.all.each do |event|
#    if event.date < Time.now
#      events << event
#    end
#   end
#    events
#  end

#  def self.future
#    events = []
#    self.all.each do |event|
#     if event.date > Time.now
#       events << event
#     end
#    end
#    events
#   end
