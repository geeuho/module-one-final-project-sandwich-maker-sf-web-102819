class CreateTable < ActiveRecord::Migration[5.2]
    def change
        create_table :sandwiches do |t|
            t.string :name
            t.integer :id
            t.text :recipe_arr
        end
    end
end
