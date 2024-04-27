require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  
  HTTP.get("https://api.exchangerate.host/list?access_key=6069b11e44c9f01bfbd63f1f29366f15")
  erb(:homepage)
end
