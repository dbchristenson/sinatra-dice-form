require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:form)
end

get("/process_roll") do
  @number_of_dice = (params['dice'] || 1).to_i
  @number_of_sides = (params['sides'] || 6).to_i
  @rolls = []

  @number_of_dice.times do
    die = rand(1..@number_of_sides)
    @rolls.push(die)
  end

  erb(:process_rolls)
end
