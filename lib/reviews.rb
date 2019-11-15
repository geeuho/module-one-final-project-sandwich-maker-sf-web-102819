def my_reviews(current_user)
    current_user.reload
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
    puts "Please put a rating! (#1-5)"
    rating = gets.chomp
        # if rating.to_i > 5 || rating.to_i < 1
        #     puts "Please put a rating! (#1-5)"
        #     rating = gets.chomp
        # end
    puts "Please put a review!"
    review = gets.chomp 
    current_review.update(rating: rating, review: review, user_id: current_user.id, sandwich_id: current_sandwich.id)
    menu(current_user)
end