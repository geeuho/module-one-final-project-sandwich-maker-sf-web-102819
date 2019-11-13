class CreateUsers < ActiveRecord::Migration[5.2]
    def change
        create_table :users do |t|
            t.integer :id
            t.string :username
            t.string :password
        end
    end
end