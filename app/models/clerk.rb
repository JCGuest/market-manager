class Clerk < ApplicationRecord
    has_many :orders
    has_many :patrons, through: :orders

    has_secure_password

    validates :email, presence: true, uniqueness: true

    validates :title, presence: true, inclusion: { in: %w(manager cutter member),
    message: "%{value} is not a valid size" }, allow_nil: true

    validates :password, presence: true, confirmation: true, length: { in: 6..50 }
end
