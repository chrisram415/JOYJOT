class GamecardsController < ApplicationController
  def correctanswer
    gamecard_id = params['gamecard'].to_i # gives string of id, turn into int
    gamecard = Gamecard.find(gamecard_id)
    gamecard.update(solved: true) if params['solved'] == 'true' # params['solved'] gives us a string of 'true'
    game = gamecard.game # in order to redirect back to game, we need a game id!
    redirect_to game_path(game) # redirect user back to the game
  end

  def index
    # @gamecards = current_user.gamecards.where(solved: true)
    # add the following code to display it from most recently created at / solved
    # @gamecards = current_user.gamecards.where(solved: true).order(created_at: :desc)
    @games = current_user.games.where(completed: true)
  end
end
