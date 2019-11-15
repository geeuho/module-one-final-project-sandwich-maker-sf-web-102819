puts
# puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# puts "} Let's make a sandwich! {"
# puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts 

current_user = nil

def welcome
    puts "Welcome to Sandwich Maker!"
    puts
    puts "Would you like to sign up or log in?"
    prompt = gets.chomp
    if prompt == "sign up"
        user_create
    elsif prompt == "log in"
        log_in
    else 
        puts
        puts "Sorry that was invalid input, try again!"
        puts
        puts "‧͙⁺˚*･༓☾　　☽༓･*˚⁺‧͙  ‧͙⁺˚*･༓☾　　☽༓･*˚⁺‧͙"
        puts
        welcome
    end
end

def user_create
    puts
    puts "Welcome! To get started please enter a username."
    user_name = gets.chomp
    puts
    puts "Next enter a new password."
    password = gets.chomp
    current_user = User.find_or_create_by(username: user_name, password: password)
    menu(current_user)
end


def log_in
    puts
    puts "Welcome back! Please enter your username."
    user_name = gets.chomp
    puts
    puts "Please enter your password."
    password = gets.chomp
        if User.find_by(username: user_name, password: password) != nil
            current_user = User.find_by(username: user_name, password: password)
            menu(current_user)
        else
            puts
            puts "Password incorrect. Please try again."
            puts
            puts "‧͙⁺˚*･༓☾　　☽༓･*˚⁺‧͙  ‧͙⁺˚*･༓☾　　☽༓･*˚⁺‧͙"
            log_in
        end
end


def octothorpe_wall 
    puts "#" * 79
end

def star_wall_thing 
    puts "*-" * 39 + "*"
end
