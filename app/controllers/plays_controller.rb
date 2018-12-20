# frozen_string_literal: true

class PlaysController < ApplicationController
  def create
    @play = Play.create(play_params)
  end

  private

  def play_params
    params.require(:play).permit(:counter, :img_url)
  end
end
