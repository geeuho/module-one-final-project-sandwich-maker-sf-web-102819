10.times do
    Sandwich.create(name: Faker::Food.dish)
end

10.times do
    User.create(username: Faker::Name.name, password: Faker::String)
end

10.times do
    SandwichReview.create(rating: rand(5), review: Faker::Food.description)
end

# API code to populate DB