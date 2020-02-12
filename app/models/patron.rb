class Patron < ApplicationRecord
    has_many :orders
    has_many :clerks, through: :orders
end
