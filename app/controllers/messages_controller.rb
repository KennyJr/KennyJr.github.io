class MessagesController < ApplicationController

  def create
    @forum = Forum.find(message_params[:forum_id])
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = ["Message created!"]
      # @forum.updated_at = @message.created_at
      # @forum.update(updated_at: @message.created_at)
      redirect_to forum_path(@forum.id)
    else
      flash[:danger] = @message.errors.full_messages
      redirect_to forum_path(@forum.id)
    end
  end


  def destroy
  end

  private

     def message_params
       params.require(:message).permit(:content, :name, :forum_id)
     end
end
