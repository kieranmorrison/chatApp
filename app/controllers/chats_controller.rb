class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :join]
  before_action :require_login

  def index
    if current_user.isClient
      @chats = Chat.where(:user => current_user).order(:created_at)
    elsif current_user.isSupport
      @chats = Chat.where(:support_user => current_user).order(:created_at)
    end
  end

  def show
    @messages = @chat.messages
  end

  def new
    @chat = Chat.new
    @chat.user = current_user
    @chat.save
    redirect_to chat_url @chat
  end

  def join
    @chat.support_user = current_user
    @chat.save
    redirect_to chat_url @chat
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:user_id, :support_user_id)
    end
end
