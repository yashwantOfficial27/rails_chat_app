class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true, length: {minimum: 1, maximum: 1000}

  after_create_commit {broadcast_message}

  private 

  def broadcast_message
    broadcast_append_to "room_#{room.id}_messages",
                        partial: "messages/message",
                        locals: {message: self},
                        target: "messages"
  end
end
