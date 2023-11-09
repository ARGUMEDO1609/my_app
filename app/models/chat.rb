class Chat < ApplicationRecord
    validates :name, presence: true
    has_many :user_chats
    has_many :users, through: :user_chats
    has_many :messages
    
    after_update_commit :update_chat_details
    
    private 
    
    def update_chat_details
        broadcast_replace_to('chat_details_channel', partial: 'shared/chat', locals: { chat: self }, target: "chat_#{id}")
     end
    end