class Sandwich < ActiveRecord::Base
   has_many :sandwich_reviews
   has_many :users, through: :sandwich_reviews
end