class LinesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lines_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
