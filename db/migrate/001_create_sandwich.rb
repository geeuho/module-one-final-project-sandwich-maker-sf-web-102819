class CreateSandwich < ActiveRecord::Migration[5.2]
    def change
        create_table :sandwiches do |t|
            t.string :name
            t.text :recipe_arr
        end
    end
end
