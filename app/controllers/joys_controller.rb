class JoysController < ApplicationController

  def index
    @joys = current_user.joys.all
  end

end
