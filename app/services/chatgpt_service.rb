# require 'httparty'
require 'http'
class ChatgptService
  # include HTTParty

  attr_reader :api_url, :options, :model, :message

  def initialize(message, model = 'gpt-3.5-turbo')
    api_key = Rails.application.credentials.chatgpt_api_key

    @options = {
      auth: "Bearer #{api_key}",
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{api_key}"
      }
    }
    @api_url = 'https://api.openai.com/v1/chat/completions'
    @model = model
    @message = message
  end

  def call
    body = {
      model:,
      messages: [{ role: 'user', content: message }],
    }

    response = HTTP.auth(options[:auth])
                   .timeout(80)
                   .post(api_url, json: body)

    JSON.parse(response.body.to_s)['choices'][0]['message']['content']
  end

  class << self
    def call(message, model = 'gpt-3.5-turbo')
      new(message, model).call
    end
  end
end
