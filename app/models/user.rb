class User < ApplicationRecord
    # has_one :division
    belongs_to :division
    has_one :report
    
    validates :no, uniqueness: true
    validates :no, numericality: true
    validates :no, numericality: { greater_than_or_equal_to: 1 }
end
