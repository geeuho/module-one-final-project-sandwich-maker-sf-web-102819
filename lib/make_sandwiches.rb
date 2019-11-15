def make_sandwich(current_user)
    puts
    puts "What kind of sandwich would you like to make?"
    kind_of_sandwich = gets.chomp

    sandwiches = RestClient.get("http://www.recipepuppy.com/api/?q=sandwich, #{kind_of_sandwich}")
    recipe_hash = JSON.parse(sandwiches)
    current_sandwiches = []
        recipe_hash["results"].each do |recipe|
            current_sandwiches << Sandwich.find_or_create_by(name: recipe["title"], recipe_arr: recipe["ingredients"])
        end
    puts
    puts "Which sandwich would you like to make? Please select a number."
    puts
    sandwich_list(current_sandwiches)
    sandwich_select = gets.chomp
    sandwich_number = sandwich_select.to_i
    current_sandwich = current_sandwiches[sandwich_number-1]
    puts
    puts "Great, so you'd like to make a #{current_sandwich.name}?"
    puts
    puts "Yum! Sounds great."
    puts
    puts "To make this sandwich you'll need... #{current_sandwich.recipe_arr}."
    puts
    puts "Enjoy~"
    puts
    SandwichReview.find_or_create_by(user_id: current_user.id, sandwich_id: current_sandwich.id)
    menu(current_user)
    # puts current_user.sandwiches   
end



def sandwich_list(sandwiches)
    i = 0 
    while i < sandwiches.length
        puts "#{i+1}. #{sandwiches[i].name}"
        i+= 1
    end
end