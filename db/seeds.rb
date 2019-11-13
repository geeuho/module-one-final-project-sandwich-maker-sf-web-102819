10.times do
    Sandwich.create(name: Faker::Food.dish)
end

# API code to populate DB