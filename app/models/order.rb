class Order < ApplicationRecord
    belongs_to :clerk
    belongs_to :patron
    accepts_nested_attributes_for :patron

    def patron_attributes=(patron_attributes)
        self.patron = Patron.find_or_create_by(name: patron_attributes[:name])
        self.patron.phone = patron_attributes[:phone]
    end

            

        
end