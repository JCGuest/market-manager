class Order < ApplicationRecord
    belongs_to :clerk
    belongs_to :patron
    accepts_nested_attributes_for :patron

    validates :item, presence: true
    validates :pick_up, presence: true
    validates :amount, presence: true 
    validates :complete, inclusion: { in: [true, false],
    message: "status must be either *true or *false." }

    def patron_attributes=(patron_attributes)
        self.patron = Patron.find_or_create_by(patron_attributes) unless patron_attributes[:name].blank?
    end

    end
        
    # def categories_attributes=(category_attributes)
    #     category_attributes.values.each do |category_attribute|
    #       if category_attribute["name"].present?
    #         category = Category.find_or_create_by(category_attribute)
    #         self.categories << category
    #       end
    #     end
    #   end



    # def patron_attributes=(patron_attributes)
    #     patron_attributes.values.each do |attribute|
    #         if attribute["name"].present?
    #             patron = Patron.find_or_create_by(attribute)
    #             self.patron << patron
    #         end
    #     end
    # end
        