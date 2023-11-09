class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  
  after_create_commit :broadcast_chat_messages_create 
  after_update_commit :broadcast_chat_messages_update
  after_destroy_commit :broadcast_chat_messages_destroy
      
  private 
    
  def broadcast_chat_messages_create
      broadcast_append_to('chat_messages_channel', partial: 'messages/message', locals: { message: self }, target: "chat_messages_div")
   end

    def broadcast_chat_messages_update
      broadcast_replace_to('chat_messages_channel', partial: 'messages/message', locals: { message: self }, target: "message_#{id}")
    end 

    def broadcast_chat_messages_destroy
      broadcast_remove_to('chat_messages_channel', target: "message_#{id}")
    end 
end