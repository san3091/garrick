class SpeechesController < ApplicationController
  def show
    # case params[:query]
    # when 'next'
    #   @speech = find_next_speech
    # when 'prev'
    #   @speech = find_previous_speech
    # end

    ActionCable.server.broadcast "speeches_channel", 
                                  speech: render_speech(@speech)
  end

  private

  # def find_next_speech
  # end

  # def find_previous_speech
  # end

  # def set_speech
  #   @speech = Speech.find(params[:id])
  # end

  # def set_character
    
  # end
end
