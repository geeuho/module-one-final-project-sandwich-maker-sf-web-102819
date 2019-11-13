class SandwichReview < ActiveRecord::Base
    belongs_to :sandwiches
    belongs_to :users
end