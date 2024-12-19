class EventsController < ApplicationController
  def upvote
    command_bus.call(UpvoteEvent.new(event_id: params[:id], user_id: clerk_user["id"]))
    redirect_to root_path, notice: "You upvoted the event!"
  end

  def downvote
    command_bus.call(DownvoteEvent.new(event_id: params[:id], user_id: clerk_user["id"]))
    redirect_to root_path, notice: "You downvoted the event!"
  end

  def index
    @events = Event.all
  end
end
