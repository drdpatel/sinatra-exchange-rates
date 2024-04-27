require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  
  @raw_response = HTTP.get("https://api.exchangerate.host/list?access_key=6069b11e44c9f01bfbd63f1f29366f15")

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)

  @currencies = @parsed_response.fetch("currencies")

  erb(:homepage)
end

get("/:first_symbol") do

@the_symbol = params.fetch("first_symbol")
erb(:one)

end
