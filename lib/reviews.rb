def my_reviews(current_user)
    current_user.reload
    if current_user.sandwich_reviews.length == 0
        puts "You don't have any reviews yet!"
    else
        sandwich_reviews_array = current_user.sandwich_reviews
        i = 0 
        while i < sandwich_reviews_array.length
            if sandwich_reviews_array[i].review != nil
                star_wall_thing
                puts "Name: #{sandwich_reviews_array[i].sandwich.name}"
                puts "Review: #{sandwich_reviews_array[i].review}"
                puts "You rated this sandwich #{sandwich_reviews_array[i].rating} stars out of 5"
                star_wall_thing
                puts
                puts "~"
            end
            i += 1
        end
    end
    menu(current_user)
end

def sandwich_reviews(current_user)
    puts "Which sandwich would you like to see reviews for?"
    search_word = gets.chomp
    sandwich_array = []
    Sandwich.all.each do |sandwich|
        if sandwich.name.downcase.include?(search_word)
            sandwich_array << sandwich
        end
    end
    sandwich_list(sandwich_array)
    puts "Please select the number of the sandwich you would like to review."
    review_search = gets.chomp
    review_number = review_search.to_i
    sandwich_found = sandwich_array[review_number - 1]
    current_review = sandwich_found.sandwich_reviews
    # p current_review
    if !!current_review[0].review == true 
        current_review.each do |review|
            star_wall_thing
            puts "Here are the reviews for #{review.sandwich.name}"
            puts "Review by: #{review.user.username}"
            puts "Review : #{review.review}"
            puts "Rating : #{review.rating} out of 5 stars"
            star_wall_thing
            puts
        end
    else
        puts "Sorry that sandwich has no reviews, yet. Try again!"
        sandwich_reviews(current_user)
    end
    menu(current_user)
end

 

def write_review(current_user)
    current_user.reload
    puts "Which sandwich would you like to review? Please select a number."
    your_sandwiches = current_user.sandwiches
    sandwich_list(your_sandwiches)
    sandwich_select = gets.chomp
    sandwich_number = sandwich_select.to_i
        if sandwich_number <= your_sandwiches.length
            current_sandwich = your_sandwiches[sandwich_number-1]
            current_review = SandwichReview.find_by(user_id: current_user.id, sandwich_id: current_sandwich.id)
                if current_review.review == nil
                    create_a_review(current_review, current_user, current_sandwich)
                # elsif !!current_review.review == true 
                else
                    puts "You already have a review for this sandwich! Did you want to update it (Y/N)?"
                    user_input = gets.chomp
                        if user_input == "Y"
                            create_a_review(current_review, current_user, current_sandwich)
                        else 
                            menu(current_user)
                        end
                end
        else 
            puts "That is not a valid number. Please try again."
            write_review(current_user)
        end
end


def create_a_review(current_review, current_user, current_sandwich)
    puts "How would you rate this sandwich on a scale from 1-5?"
    puts "(1 being the worst and 5 being the best you've ever had)"
    rating = gets.chomp
        if rating.to_i > 5 || rating.to_i < 1
            puts "Please only enter a number from 1-5."
            puts
            create_a_review(current_review, current_user, current_sandwich)
        else
            puts
            puts "What were your thoughts about the sandwich?"
            puts "Did you love it or hate it? Would you make it again?"
            puts "Let everyone know!"
            review = gets.chomp 
            current_review.update(rating: rating, review: review, user_id: current_user.id, sandwich_id: current_sandwich.id)
            puts "Awesome! Thanks for contributing your thoughts!"
            puts
            menu(current_user)
        end
end