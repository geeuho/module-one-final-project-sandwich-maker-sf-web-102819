puts
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "} Let's make a sandwich! {"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "♫♪.ılılıll|̲̅̅●̲̅̅|̲̅̅=̲̅̅|̲̅̅●̲̅̅|llılılı.♫♪"
puts 

#first input
puts "Please enter what ingredients you would like to put into your sandwich."
user_input = gets.chomp
response = RestClient.get("http://www.recipepuppy.com/api/?q=sandwich,#{user_input}")

recipe_hash = JSON.parse(response)
# recipe = recipe_hash["results"].map { |item| item["title"] }
sandwich_recipes = recipe_hash["results"].map do |recipe|
    title = recipe["title"]
    ingredients = recipe["ingredients"]
    description = recipe["description"]
    puts #{title: title, ingredients: ingredients, description: description}
end



# # Populate the database with API data
# octothorpe_wall = "#" * 79
# star_wall_thing = "*-" * 39 + "*"
# books_selected_info.each do |book|
#     puts octothorpe_wall
#     puts
#     puts "#{book[:title]} by #{book[:authors]}"
#     puts star_wall_thing
#     puts book[:description]
#     puts
# end
# puts octothorpe_wall

