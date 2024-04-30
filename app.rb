require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  
  @raw_response = HTTP.get("https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}")

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)

  @currencies = @parsed_response.fetch("currencies")

  erb(:homepage)
end

get("/:from_currency") do

@the_symbol = params.fetch("from_currency")

@raw_response = HTTP.get("https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}")

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)

  @currencies = @parsed_response.fetch("currencies")
  
erb(:one)
end

get("/:from_currency/:to_currency") do

  @from = params.fetch("from_currency")
  @to = params.fetch("to_currency")

  erb(:step_two)
end
