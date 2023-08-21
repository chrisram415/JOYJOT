# app/services/stablediffusion_service.rb

class StablediffusionService
  def initialize(prompt)
    @prompt = prompt
  end

  def call
    url = "https://stablediffusionapi.com/api/v3/text2img"
    options = {
      body: {
        "key": ENV["SD_ACCESS_TOKEN"],
        "prompt": @prompt,
        "negative_prompt": nil,
        "width": "512",
        "height": "512",
        "samples": "1",
        "num_inference_steps": "20",
        "seed": nil,
        "guidance_scale": 7.5,
        "safety_checker": "yes",
        "multi_lingual": "no",
        "panorama": "no",
        "self_attention": "no",
        "upscale": "no",
        "embeddings_model": nil,
        "webhook": nil,
        "track_id": nil
      }
    }
    response = HTTParty.post(url, options)
    response["output"].first
  end
end
