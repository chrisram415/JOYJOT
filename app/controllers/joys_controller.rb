class JoysController < ApplicationController

  def new
    @joy = Joy.new
  end

  def create
    @joy = Joy.new(joy_params)
    @joy.user = current_user
    if @joy.save
      redirect_to new_joy_path
    else
      flash[:alert] = 'Something went wrong.'
      render :new
    end
  end

  def index
    @joys = current_user.joys.all
  end

  private

  def joy_params
    params.require(:joy).permit(:description, :rating)
  end

end
