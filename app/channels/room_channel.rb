class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel_#{params['room']}"
  end
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def speak(data)
  	Message.create! body: data['message'], user_id: current_user.id, room_id: params['room']
  end

end
