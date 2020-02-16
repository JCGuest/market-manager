class Patron < ApplicationRecord
    has_many :orders
    has_many :clerks, through: :orders

    validates :name, presence: true
    validates :phone, presence: true, length: { minimum: 7 }
end
