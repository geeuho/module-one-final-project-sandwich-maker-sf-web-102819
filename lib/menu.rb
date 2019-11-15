def menu(current_user) 
    puts
    puts "»»——⍟——««  »»——⍟——««  »»——⍟——««  »»——⍟——««"
    puts
    puts "Welcome #{current_user.username}!"
    puts
    puts "We are here to make your sandwich dreams come true! What would you like to do?"
    puts "(Please enter the number of your selection)"
    puts
    puts "1. Find a new sandwich recipe"
    puts "2. Write a new review"
    puts "3. See reviews you've written"
    puts "4. Logout"
    puts
    menu_prompt = gets.chomp
        if menu_prompt == "1"
            make_sandwich(current_user)
        elsif menu_prompt == "2"
            write_review(current_user)
        elsif menu_prompt == "3"
            my_reviews(current_user)
        elsif menu_prompt == "4"
            return 
        else 
            puts "That was an invalid response. Please try again."
            puts
            menu(current_user)
        end
end