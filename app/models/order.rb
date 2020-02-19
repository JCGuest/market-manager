class Order < ApplicationRecord
    belongs_to :clerk
    belongs_to :patron
    accepts_nested_attributes_for :patron

    validates :item, presence: true
    validates :pick_up, presence: true
    validates :amount, presence: true 
    # validates :complete, inclusion: { in: %w(true false), 
    # message: "status must be either *true or *false"}


    def patron_attributes=(patron_attributes)
        self.patron = Patron.find_or_create_by(name: patron_attributes[:name])
        self.patron.phone = patron_attributes[:phone]
    end
   
end