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

  if(@type == "square")
    @input = params.fetch("input").to_i
    @out = (@input * @input).to_f
    erb(:square_results)
  elsif(@type == "square_root")
    @input = params.fetch("input").to_i
    @out = Math.sqrt(@input)
    erb(:square_root_results)
  elsif(@type == "random")
    @min = params.fetch("minimum").to_f
    @max = params.fetch("maximum").to_f
    @out = rand((@min)..(@max))
    erb(:random_results)
  elsif(@type == "payment")
    @apr = (params.fetch("apr").to_f / 100)
    mpr = @apr / 12
    @years = params.fetch("years").to_i * 12
    @principal = params.fetch("principal").to_f
    @out = (@principal * mpr) / (1 - ((1 + mpr) ** (@years * -1.0)))
    erb(:payment_results)
  end
  
end
