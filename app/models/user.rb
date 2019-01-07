class User < ApplicationRecord
  include Clearance::User
  has_many :messages
  enum usertype: [:client, :support]
  
  def isClient
    self.usertype == 'client'
  end

  def isSupport
    self.usertype == 'support'
  end
end
