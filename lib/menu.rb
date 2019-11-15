def menu(current_user) 
    puts
    puts "  »»——⍟——««   »»——⍟——««   »»——⍟——««   »»——⍟——««   "
    puts
    sleep(0.5)
    puts "Welcome #{current_user.username}!"
    sleep (0.5)
    puts
    puts "We are here to make your sandwich dreams come true!"
    sleep (0.5)
    puts
    puts "What would you like to do?"
    puts "(Please enter the number of your selection)"
    sleep (0.5)
    puts
    puts "1. Find a new sandwich recipe"
    sleep (0.5)
    puts "2. Write a new review"
    sleep (0.5)
    puts "3. See reviews you've written"
    sleep (0.5)
    puts "4. See all the reviews for a sandwich"
    sleep (0.5)
    puts "5. Have a sandwich"
    sleep (0.5)
    puts "6. Logout"
    puts
    menu_prompt = gets.chomp
        if menu_prompt == "1"
            make_sandwich(current_user)
        elsif menu_prompt == "2"
            write_review(current_user)
        elsif menu_prompt == "3"
            my_reviews(current_user)
        elsif menu_prompt == "4"
            sandwich_reviews(current_user)
        elsif menu_prompt == "5"
            have_a_sandwich(current_user)
        elsif menu_prompt == "6"
            return 
        else 
            puts "That was an invalid response. Please try again."
            puts
            menu(current_user)
        end
end