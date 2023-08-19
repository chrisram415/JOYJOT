# app/services/stablediffusion_service.rb


class StablediffusionService
  attr_reader :client, :prompt

  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call

  end
end
