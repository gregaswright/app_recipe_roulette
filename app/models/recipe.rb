class Recipe < ActiveRecord::Base
    has_many :user_recipes
    has_many :users, through: :user_recipes
end