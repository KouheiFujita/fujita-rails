class User < ApplicationRecord
    # has_one :division
    belongs_to :division
    has_one :report
end
