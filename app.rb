require "sinatra"
require "sinatra/reloader"

get("/") do
  
  erb(:new)

end

get("/:calc/new") do
  @type = params.fetch("calc")
  if(@type == "square")
    erb(:square_new)
  elsif(@type == "square_root")
    erb(:square_root_new)
  elsif(@type == "payment")
    erb(:payment_new)
  elsif(@type == "random")
    erb(:random_new)
  end
end

get("/:calc/results") do
  @type = params.fetch("calc")
  @input = params.fetch("input")
  erb(:results)
end
