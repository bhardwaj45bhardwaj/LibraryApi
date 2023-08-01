class User < ApplicationRecord
	has_many :issue_books
	has_many :books, through: :issue_books

	validates :email, presence: true, uniqueness: true
	
end
