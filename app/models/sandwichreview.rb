class SandwichReview < ActiveRecord::Base
    belongs_to :sandwich
    belongs_to :user
end