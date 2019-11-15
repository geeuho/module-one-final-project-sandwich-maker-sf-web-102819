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
        if sandwich_number > 0 && sandwich_number <= current_sandwiches.length        
            current_sandwich = current_sandwiches[sandwich_number-1]
            puts
            puts "Great, so you'd like to make a #{current_sandwich.name}?"
            sleep(0.5)
            puts
            puts "Yum! Sounds great."
            sleep(0.5)
            puts
            puts "To make this sandwich you'll need..."
            sleep(0.7)
                sandwich_ingredients = current_sandwich.recipe_arr.split(", ")
                sandwich_ingredients.each do |ingredient|
                    puts "#{ingredient}"
                    sleep(0.5)
                end
            sleep(0.5)
            puts
            puts "Enjoy~"
            puts "After you make the sandwich, let us know your thoughts by leaving a review of the recipe!"
            puts
            SandwichReview.find_or_create_by(user_id: current_user.id, sandwich_id: current_sandwich.id)
            sleep(0.9)
            menu(current_user)  
        else
            puts
            puts "Sorry, that wasn't a sandwich. Please try again."
            make_sandwich(current_user)
        end
end



def sandwich_list(sandwiches)
    i = 0 
    while i < sandwiches.length
        puts "#{i+1}. #{sandwiches[i].name}"
        i+= 1
    end
end