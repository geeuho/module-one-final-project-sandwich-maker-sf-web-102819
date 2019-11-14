puts
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "} Let's make a sandwich! {"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "♫♪.ılılıll|̲̅̅●̲̅̅|̲̅̅=̲̅̅|̲̅̅●̲̅̅|llılılı.♫♪"
puts 

current_user = nil

def welcome
    puts "Welcome to Sandwich Maker, please enter 1 for sign up and 2 for log in"
    prompt = gets.chomp
    if prompt == "1"
        user_create
    elsif prompt == "2"
        log_in
    else 
        puts "Sorry that was invalid input, try again!"
        welcome
    end
end

def user_create
    puts "Create_user"
    puts "Welcome! To get started please enter a username."
    user_name = gets.chomp
    puts "Next enter a new password."
    password = gets.chomp
    current_user = User.find_or_create_by(username: user_name, password: password)
    menu(current_user)
end


def log_in
    puts "Log_in"
    puts "Welcome back! Please enter your username."
    user_name = gets.chomp
    puts "Please enter your password."
    password = gets.chomp
    current_user = User.find_by(username: user_name, password: password)
    menu(current_user)
end

def menu(current_user) 
    puts "Welcome #{current_user.username}! Please enter a number from the following options:"
    puts "1. Find a new sandwich recipe"
    puts "2. Write a new review"
    puts "3. See reviews you've made"
    puts "4. Logout"
    menu_prompt = gets.chomp
        if menu_prompt == "1"
            make_sandwich(current_user)
        elsif menu_prompt == "2"
            write_review(current_user)
        elsif menu_prompt == "3"
            my_reviews(current_user)
        elsif menu_prompt == "4"
            puts "Thanks for stopping by!"
            return 
        else 
            puts "That was an invalid response. Please try again."
            menu(current_user)
        end
end

def my_reviews(current_user)
    if current_user.sandwich_reviews.length == 0
        puts "You don't have any reviews yet!"
    else
        sandwich_reviews_array = current_user.sandwich_reviews
        i = 0 
        while i < sandwich_reviews_array.length
            if sandwich_reviews_array[i].review != nil
            puts "#{sandwich_reviews_array[i].sandwich.name}"
            puts "#{sandwich_reviews_array[i].review}"
            puts "You rated this sandwich #{sandwich_reviews_array[i].rating} stars out of 5"
            star_wall_thing
            end
            i += 1
        end
    end
    menu(current_user)
end

 

def write_review(current_user)
    puts "Which sandwich would you like to review? Please select a number."
    your_sandwiches = current_user.sandwiches
    sandwich_list(your_sandwiches)
    sandwich_select = gets.chomp
    sandwich_number = sandwich_select.to_i
    current_sandwich = your_sandwiches[sandwich_number-1]
    current_review = SandwichReview.find_by(user_id: current_user.id, sandwich_id: current_sandwich.id)
    puts current_review.review
    puts current_review
    puts current_review.sandwich_id
        if current_review.review == nil
            puts "no"
            puts "Please put a rating! (#1-5)"
            rating = gets.chomp
            puts "Please put a review!"
            review = gets.chomp 
            current_review.update(rating: rating, review: review, user_id: current_user.id, sandwich_id: current_sandwich.id)
            # menu(current_user)
        else
            puts "You already have a review for this sandwich! Did you want to update it (Y/N)?"
            user_input = gets.chomp
                if user_input == "Y"
                    puts "Please put a rating! (#1-5)"
                    rating = gets.chomp
                    puts "Please put a review!"
                    review = gets.chomp 
                    current_review.update(rating: rating, review: review, user_id: current_user.id, sandwich_id: current_sandwich.id)
                else 
                    menu(current_user)
                end
        end
end

def make_sandwich(current_user)
    puts "Please input ingredients you would like to add to your sandwich"
    kind_of_sandwich = gets.chomp
    sandwiches = RestClient.get("http://www.recipepuppy.com/api/?q=BLT, #{kind_of_sandwich}, sandwich")
    recipe_hash = JSON.parse(sandwiches)
    current_sandwiches = []
        recipe_hash["results"].each do |recipe|
            current_sandwiches << Sandwich.find_or_create_by(name: recipe["title"], recipe_arr: recipe["ingredients"])
        end
    puts "Which sandwich would you like to make? Please select a number."
    sandwich_list(current_sandwiches)
    sandwich_select = gets.chomp
    sandwich_number = sandwich_select.to_i
    current_sandwich = current_sandwiches[sandwich_number-1]
    puts "You selected the #{current_sandwich.name}"
    puts "To make this sandwich you need... #{current_sandwich.recipe_arr}!"
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

# if User.all.select {|user| user.password == password_input}
#     password
#     User.create(username: username_input)

# def ingredients
# puts "Let's get started! Please enter what ingredients you would like to put into your sandwich."
# ingredients_input = gets.chomp
# end

def octothorpe_wall 
    puts "#" * 79
end

def star_wall_thing 
    puts "*-" * 39 + "*"
end

