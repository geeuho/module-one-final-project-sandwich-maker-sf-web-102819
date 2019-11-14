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
    else 
        log_in
    end
end

def user_create
    puts "Create_user"
    puts "Welcome! To get started please enter a username."
    user_name = gets.chomp
    puts "Next enter a new password."
    password = gets.chomp
    current_user = User.find_or_create_by(username: user_name, password: password)
    p current_user
    # menu(current_user)
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
    menu_prompt = gets.chomp
        if menu_prompt == "1"
            make_sandwich(current_user)
        elsif menu_prompt == "2"
            write_review(current_user)
        else 
            current_user.sandwich_reviews
        end
end

def write_review(current_user)
    puts "Please put a rating!"
    rating = gets.chomp
    puts "Please put a review!"
    review = gets.chomp 
    SandwichReview.create(rating: rating, review: review, user_id: current_user.id)
end







# if User.all.select {|user| user.password == password_input}
#     password
#     User.create(username: username_input)

# def ingredients
# puts "Let's get started! Please enter what ingredients you would like to put into your sandwich."
# ingredients_input = gets.chomp
# end

# def results
# puts "Ooh, sounds yummy! Here are some sandwiches you could make:"
# octothorpe_wall = "#" * 79
# star_wall_thing = "*-" * 39 + "*"
# #enter database to retrieve recipes matching ingredients
# # .each do |recipe|
# #     puts octothorpe_wall
# #     puts
# #     puts "#{book[:title]} by #{book[:authors]}"
# #     puts star_wall_thing
# #     puts book[:description]
# #     puts
# end
# puts octothorpe_wall

