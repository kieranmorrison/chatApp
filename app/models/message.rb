class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  validates :text, presence: true
  
  after_create_commit :broadcast_message

  private

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end
end
