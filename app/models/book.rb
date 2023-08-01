class Book < ApplicationRecord
	has_many :issue_books
	has_many :users, through: :issue_books
	
	validates :uid, presence: true, uniqueness: true
	
	enum :status, [:available, :checked_out]
end


