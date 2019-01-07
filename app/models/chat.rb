class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :support_user, :class_name => 'User', optional: true
  
  has_many :messages
end
