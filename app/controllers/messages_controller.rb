class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:group)
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: message.group.id)
  end

end
