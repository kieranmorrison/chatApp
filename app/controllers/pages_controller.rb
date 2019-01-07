class PagesController < ApplicationController
  before_action :require_login

  def index
    if current_user.usertype == 'client'
      @waiting_chats = Chat.where(:user => current_user, :support_user => nil)
    else
      @waiting_chats = Chat.where(:support_user => nil)
    end
  end
  
end