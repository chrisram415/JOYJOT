class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    if @game.gamecards.all?(&:solved)
      @game.update(completed: true)
    else
      @current_gamecard = @game.gamecards.where(solved: false).sample # one of the unsolved gamecards
    end
  end

  def index
  end
end
