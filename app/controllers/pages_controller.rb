# Controller responsible for managing pages in the application.
# <%# adding line of comment code to fix revert %>


class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @joy = Joy.new

    # if user_signed_in?  # Check if a user is signed in
    #     # Your existing code to check the day and execute the weekly task
    #   # codes so it will not run code again if ran already
    #   # dvelopment version, Check if the current day is Thursday, Friday, Saturday, or Sunday
    #   if [Time.now.thursday?, Time.now.friday?, Time.now.saturday?, Time.now.sunday?].any?
    #     # final version for only friday of calling the mthod below but only triggers once every friday anytime user arrives to home
    #     # if Time.now.friday? && Time.now.hour >= 0
    #     unless session[:weekly_task_executed]
    #       run_weekly_task
    #       session[:button_triggered] = true
    #     end
    #   else
    #     session[:button_triggered] = false
    #   end
    # end

    if user_signed_in?
      # Check if the current day is Friday or Saturday
      if [Time.now.friday?, Time.now.saturday?].any?
        unless session[:weekly_task_executed]
          run_weekly_task
          session[:weekly_task_executed] = true
        end
      else
        session[:weekly_task_executed] = false
      end
    end

    # # test recommendations each time home loads code: (uncomment line below)
    # run_weekly_task

    # <%# 1 inspire per joy so we will create a variable that stores the result of selecting a premade string at random
    # add variable in pages/home method controller to view and display
    @random_prompt = select_random_prompt

    # code for button to be triggered to display only if the create rec mehtod was created
    # and if the button was noit previous clicked, meaning it only appears once
    # @weekly_task_executed = session[:weekly_task_executed] # Set instance variable
    # instance variable that dtetermine if button triggered or not by checking the session
    @button_triggered = session[:button_triggered] || false
  end



  private

  def run_weekly_task
    # Your weekly task logic here
    # code below creates a reccomendation from the joys within a period from current_user
    @user = current_user
    startdate = Date.today.prev_occurring(:friday)
    # enddate = startdate + 6.days
    enddate = startdate + 7.days
    @joys = @user.joys.where(created_at: startdate...enddate)
    # @joys = @user.joys

    descriptions = @joys.map { |joy| joy.description }

    @response = OpenaiService.new("You are JoyJot, a cheerful motivational chatbot friend. Your task is to craft 1 action based on the following parameters, within a 100-words, including emojis, as a list. If my collection contains joys this week, only recommend 2 weekend activities based on them to amplify my joy. But if my collection is empty, suggest 3 methods to discover happiness.

      Here's my collection: #{descriptions}").call

    # @response = OpenaiService.new("You are JoyJot, a cheerful motivational chatbot friend. count how many strings I have in this array and tell me the number and a joke: #{descriptions}").call
    @my_reccomendation = Recommendation.new
    @my_reccomendation.user = current_user
    @my_reccomendation.activity = @response # Assign the OpenAI response to the 'fortune' attribute
    # @my_reccomendation.activity = descriptions
    @my_reccomendation.save

    session[:button_triggered] = true # Set this session variable to true to show the button
  end

  # @inspire = array 50 strings %>
  def select_random_prompt
    prompts = ["What brought a smile to your face today?", "Recall a small act of kindness that warmed your heart recently.
      ", "What's a simple pleasure you enjoyed in the last 24 hours?
      ", "What's a delightful sound you heard today?
      ", "Reflect on a friend who brings positivity to your life.
      ", "Recall a time when you were pleasantly surprised by nature's beauty.
      ", "What's a vivid color that caught your eye recently?
      ", "What's a tasty treat that made your taste buds dance today?
      ", "Share a word or phrase that describes your current mood in a fun way.
      ", "Reflect on a place that holds happy memories for you.
      ", "What's a funny coincidence that made you chuckle today?", "Recall a moment when you felt completely at peace with yourself.
      ", "What's a small victory you achieved recently?
      ", "What's a hobby or activity that lights up your soul?
      ", "Reflect on a quote or saying that uplifts your spirit.
      ", "Reflect on a moment when you made someone else smile.", "What's a song that always brings a grin to your face?
      ", "Reflect on a book, movie, or show that made you laugh out loud.
      ", "What's a daily ritual that you find joy in?
      ", "Recall a moment when you felt deeply connected to someone.
      ", "Reflect on a skill or talent you're grateful to possess.", "What's a memory from childhood that still brings joy?
      ", "Share a moment when you were proud of your growth and progress.
      ", "Reflect on a gesture of friendship that touched you recently.
      ", "Reflect on a pet or animal encounter that made your day better.
      ", "What's a sight, sound, or sensation that made you pause to appreciate life today?", "What's a small achievement that made your heart skip a beat today?
      ", "What's a unique sight that caught your attention and made you smile?
      ", "Recall a time when you felt truly appreciated by someone.
      ", "What's a simple gesture you made that spread happiness to others?
      ", "Reflect on a time when you stepped out of your comfort zone and felt proud.", "Recall a conversation that left you feeling uplifted and inspired.
      ", "Reflect on a skill you used today that made you feel capable.
      ", "What's a quirky or funny item that made you smile when you saw it?
      ", "Recall a moment when you made someone else's day a little brighter.
      "]
    prompts.sample
  end
end
