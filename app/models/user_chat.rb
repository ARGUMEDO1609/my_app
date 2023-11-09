class UserChat < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  after_create_commit do
    broadcast_append_to_chat
  end

  private

  def broadcast_append_to_chat
    broadcast_append_to(
      'users_chats_channel',
      target: "user_#{user_id}_chats",
      partial: 'shared/chat',
      locals: { chat: Chat.find(chat_id) }
    )
  end
end