class Order < ApplicationRecord
    belongs_to :clerk
    belongs_to :patron
    accepts_nested_attributes_for :patron
    validates_associated :patron

    validates :item, presence: true
    validates :pick_up, presence: true
    validates :amount, presence: true 
    validates :complete, inclusion: { in: [true, false],
    message: "status must be either *true or *false." }
    
    scope :due, ->(time) { where("pick_up = ?", time) }

    def complete?
      if self.complete
        return "yes"
      else !self.complete
        return "no"
      end
    end

    validate :pick_up_is_future_date
    def pick_up_is_future_date
      if pick_up.present? && pick_up < Date.today
        errors.add(:pick_up, " date can't be in the past")
      end
    end

    def patron_attributes=(patron_attributes)
        self.patron = Patron.find_or_create_by(patron_attributes) unless patron_attributes[:name].blank?
    end

end
        