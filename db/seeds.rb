# 10.times do
#     Sandwich.create(name: Faker::Food.dish)
# end

# 10.times do
#     User.create(username: Faker::Name.name, password: Faker::String)
# end

# 10.times do
#     SandwichReview.create(rating: rand(5), review: Faker::Food.description)
# end

# API code to populate DB

sandwiches = RestClient.get("http://www.recipepuppy.com/api/?q=BLT, sandwich")
recipe_hash = JSON.parse(sandwiches)
    recipe_hash["results"].each do |recipe|
         Sandwich.find_or_create_by(name: recipe["title"], recipe_arr: recipe["ingredients"])
    end


    {"title"=>"Recipe Puppy", "version"=>0.1, "href"=>"http://www.recipepuppy.com/", 
    "results"=>[{"title"=>"BLT Club Sandwich", "href"=>"http://www.recipezaar.com/BLT-Club-Sandwich-267197", 
    "ingredients"=>"american cheese, bread, bacon, lettuce, mayonnaise, tomato", "thumbnail"=>"http://img.recipepuppy.com/176720.jpg"}, 
    {"title"=>"Chopped BLT Salad Sandwich Recipe", "href"=>"http://www.cdkitchen.com/recipes/recs/703/Chopped-BLT-Salad-Sandwich80526.shtml", 
    "ingredients"=>"bacon, caesar salad dressing, green onion, lettuce, sandwich rolls, tomato", "thumbnail"=>""}, 
    {"title"=>"\nBarbecued Shrimp &quot;Blt&quot; Sandwich Recipe\n\n", "href"=>"http://cookeatshare.com/recipes/barbecued-shrimp-blt-sandwich-78780", "ingredients"=>"shrimp, mayonnaise, sourdough bread, lettuce, tomato, bacon, salt, black pepper, vegetable oil, vegetable oil, shallot, white wine, champagne, cream, butter, lemon, salt, white pepper", "thumbnail"=>""}, {"title"=>"BLT Chicken Salad", "href"=>"http://allrecipes.com/Recipe/BLT-Chicken-Salad/Detail.aspx", "ingredients"=>"bacon, barbecue sauce, eggs, lemon juice, mayonnaise, onions, black pepper, chicken, salad greens, tomato", "thumbnail"=>"http://img.recipepuppy.com/352.jpg"}, {"title"=>"The Best BLT Sandwich", "href"=>"http://allrecipes.com/Recipe/The-Best-BLT-Sandwich/Detail.aspx", "ingredients"=>"bacon, bread, curry powder, lettuce, mustard powder, red pepper flakes, tomato", "thumbnail"=>""}, {"title"=>"Classic BLT Sandwich", "href"=>"http://www.recipezaar.com/Classic-BLT-Sandwich-129615", "ingredients"=>"bacon, mayonnaise, lettuce, tomato, bread", "thumbnail"=>"http://img.recipepuppy.com/44384.jpg"}, {"title"=>"Chicken Caesar BLT Sandwich", "href"=>"http://www.recipezaar.com/Chicken-Caesar-BLT-Sandwich-205779", "ingredients"=>"chicken, lettuce, caesar salad dressing, bread, bacon, tomato", "thumbnail"=>"http://img.recipepuppy.com/39417.jpg"}, {"title"=>"BLT &amp; Salami Sandwich", "href"=>"http://www.recipezaar.com/BLT-Salami-Sandwich-165427", "ingredients"=>"american cheese, bread, bacon, lettuce, mayonnaise, mustard, salami, salt, tomato", "thumbnail"=>"http://img.recipepuppy.com/176679.jpg"}, {"title"=>"BLT Salad", "href"=>"http://allrecipes.com/Recipe/BLT-Salad/Detail.aspx", "ingredients"=>"bacon, black pepper, garlic powder, mayonnaise, milk, romaine lettuce, salt, croutons, tomato", "thumbnail"=>"http://img.recipepuppy.com/25221.jpg"}, {"title"=>"BLT Soup", "href"=>"http://allrecipes.com/Recipe/BLT-Soup-2/Detail.aspx", "ingredients"=>"bacon, butter, celery, chicken broth, flour, french bread, lettuce, onions, black pepper, sugar, vegetable oil", "thumbnail"=>"http://img.recipepuppy.com/27386.jpg"}]}