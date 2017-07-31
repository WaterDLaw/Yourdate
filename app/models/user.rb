class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
   has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'

   has_many :personal_messages, dependent: :destroy

   has_one :profile, dependent: :destroy
   has_one :gallery, dependent: :destroy

   #make sure to create a profile after a user is created
   after_create :create_profile
   after_create :create_gallery

   def name
     email.split('@')[0]
   end

   def online?
     !Redis.new.get("user_#{self.id}_online").nil?
   end

end
