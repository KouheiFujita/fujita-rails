class Division < ApplicationRecord
    has_one :user
    
    
    validates :no, uniqueness: true
    validates :no, numericality: true
    validates :no, numericality: { greater_than_or_equal_to: 1 }
end
