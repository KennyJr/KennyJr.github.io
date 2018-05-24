class ForumsController < ApplicationController

  def show
    @forum = Forum.find(params[:id])
    @messages = @forum.messages.paginate(page: params[:page])
    @message = current_user.messages.build
  end


  def index
    @forum = current_user.forums.build
    @forum_feed_items = Forum.all.paginate(page: params[:page]).order(updated_at: :desc)
  end

  def create
    @forum = current_user.forums.new(name: params[:name],title: params[:title])
    if params[:content].empty?
      flash[:danger] = ["Content can't be blank."]
    else
      if @forum.save
        flash[:success] = ["Forum created!"]
        @message = current_user.messages.new(name: params[:name],content: params[:content], forum_id: @forum.id)
        @message.save
      else
        @forum_feed_items = []
        flash[:danger] = @forum.errors.full_messages
      end
    end
    redirect_to forums_path
  end

  def destroy
  end


  def set_resent_message
    forum.messages.order(:created_at).first
  end

  private

  def forum_params
    params.require(:forum).permit(:title, :name)
  end
end
