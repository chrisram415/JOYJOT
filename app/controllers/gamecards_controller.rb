class GamecardsController < ApplicationController
  def correctanswer
    gamecard_id = params['gamecard'].to_i # gives string of id, turn into int
    gamecard = Gamecard.find(gamecard_id)
    gamecard.update(solved: true) if params['solved'] == 'true' # params['solved'] gives us a string of 'true'
    game = gamecard.game # in order to redirect back to game, we need a game id!
    redirect_to game_path(game) # redirect user back to the game
  end

  def index
    @solved_gamecards = Gamecard.where(solved: true) # get only solved cards
  end
end
