class Report < ApplicationRecord
    belongs_to :user
    
    scope :find_date_1, ->(date_1) {
        where("entry_date >= ?", date_1) if date_1.present?
    }
    scope :find_date_2, ->(date_2) {
        where("entry_date <= ?", date_2) if date_2.present?
    }
    scope :find_name, ->(name) {
        where("user_id == ?", name) if name.present?
    }
    
    # def self.find_date_1
    #     where("entry_date >= ?", params[:date_1]) if params[:date_1].present?
    # end
    # def self.find_date_2
    #     where("entry_date <= ?", params[:date_2]) if params[:date_2].present?
    # end
    # def self.find_name
    #     where("user_id == ?", params[:name]) if params[:name].present?
    # end
end
