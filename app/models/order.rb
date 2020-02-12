class Order < ApplicationRecord
    belongs_to :clerk
    belongs_to :patron
end
