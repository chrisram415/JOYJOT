class WeeklyJob < ApplicationJob
  queue_as :default

  # ignore this page for now. This was for recommendation previosuly:
  # # def perform(*args)
  # def perform
  #   # Do something later
  #   puts "I'm testing the background job"
  #   sleep 3
  #   puts "OK it works!"
  # end
end
