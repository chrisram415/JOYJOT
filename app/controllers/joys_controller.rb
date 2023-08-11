# Controller responsible for managing joys in the application.
class JoysController < ApplicationController

  def index
    @joys = current_user.joys.all
  end

  def show
    @joy = Joy.find(params[:id])
  end

end
