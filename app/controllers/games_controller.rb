class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @current_gamecard = @game.gamecards.where(solved: false).sample # one of the unsolved gamecards
  end
end
