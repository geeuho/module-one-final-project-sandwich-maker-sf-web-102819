class CreateSandwichReviews < ActiveRecord::Migration[5.2]
    def change
        create_table :sandwich_reviews do |t|
            t.float :rating
            t.text :review
            t.integer :sandwich_id
            t.integer :user_id
        end
    end
end