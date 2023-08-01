class IssueBook < ApplicationRecord
	belongs_to :book
	belongs_to :user
    
    after_create :checked_out_book
    after_update :stock_in_book

    def checked_out_book
    	book.update(status: "checked_out")
    end

    def stock_in_book
    	book.update(status: "available")
    end
end
