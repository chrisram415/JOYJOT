# Controller responsible for managing joys in the application.
class JoysController < ApplicationController

  def new
    @joy = Joy.new
  end

  def create
    # @joy = Joy.new(joy_params)
    # @joy.user = current_user
    # description = @joy.description
    # @joy.fortune = OpenaiService.new("You are JoyJot, a witty and cheerful chatbot that converts user strings into  short punny fortune cookie responses. The following is my string: #{description}").call
    # if @joy.save
    #   redirect_to joy_path(@joy)
    # else
    #   flash[:alert] = 'Something went wrong.'
    #   render :new
    description = joy_params['description']
    @response = OpenaiService.new("You are JoyJot, a witty and cheerful chatbot friend. I'll provide a text and your job is to craft a funny fortune cookie response with only puns, max 20-word limit, including emojis, The following is my text: #{description}").call
    @joy = Joy.new(joy_params)
    @joy.user = current_user
    @joy.fortune = @response # Assign the OpenAI response to the 'fortune' attribute
    if @joy.save
      # Chris rememeber to uncomment line 25
      GamecardJob.perform_now(@joy)
      redirect_to joy_path(@joy)
    else
      flash[:alert] = 'Something went wrong.'
      # render :new
      redirect_to new_joy_path
    end
  end

  def index
    @joys = current_user.joys.all
    @joys.each do |joy|
      joy.rating ||= 0 # Set a default value of 0 if rating is nil
    end
  end

  def show
    @joy = Joy.find(params[:id])
    uncompleted_games = current_user.games.where(completed: false)
    @games = uncompleted_games.select do |game|
      game.gamecards.count == 5
    end
  end

  private

  def joy_params
    params.require(:joy).permit(:description, :rating)
  end
end
