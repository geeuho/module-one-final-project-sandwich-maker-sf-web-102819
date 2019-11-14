class User < ActiveRecord::Base
    has_many :sandwich_reviews
    has_many :sandwiches, through: :sandwich_reviews

    
end
