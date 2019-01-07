class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
  end

  def send_message(data)
    current_user.messages.create(text: data['message'], chat_id: data['chat_id'])
  end
end