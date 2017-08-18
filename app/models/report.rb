class Report < ApplicationRecord
    belongs_to :user
    has_one :comment
    
    scope :find_date_1, ->(date_1) {
        where("entry_date >= ?", date_1) if date_1.present?
    }
    scope :find_date_2, ->(date_2) {
        where("entry_date <= ?", date_2) if date_2.present?
    }
    scope :find_name, ->(name) {
        where("user_id == ?", name) if name.present?
    }
    
end
