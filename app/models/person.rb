class Person < ApplicationRecord
    # has_one :message #1:1
    has_many :message #1:多
    
    validates :name, presence: { message: 'は、必須項目です。'}
    validates :age, numericality: { message: 'は、数字で入力してください。'}
    validates :mail, email: { message: 'はメールアドレスではありません。'}
end
