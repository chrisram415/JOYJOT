class GamecardsController < ApplicationController
  def correctanswer
    gamecard_id = params['gamecard'].to_i # gives string of id, turn into int
    gamecard = Gamecard.find(gamecard_id)
    #params['solved'] gives us a string of 'true'
    #update gamecard solved to true if params['solved'] is 'true'
      #we can always update an instance
    #redirect user back to the game (games#show page)
  end
end

# in order to redirect back to game, we need a game id!
