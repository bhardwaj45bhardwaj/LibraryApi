class IssueBooksController < ApplicationController

	before_action :is_books_available, only: [:create]

   
   #Issue available book
   def create
   	  issue_book = IssueBook.new(issue_book_params)
   	  if issue_book.save
   	  	render json: issue_book, status: :created
   	  else
   	  	render json: { errors: issue_book.errors.full_messages }, status: :unprocessable_entity
   	  end

   end

   # Return book and marked them available
   def update
     issue_book = IssueBook.find_by(id: params[:id])
     if issue_book.update(update_issue_book_params)
     	render json: issue_book, status: :created
   	  else
   	  	render json: { errors: issue_book.errors.full_messages }, status: :unprocessable_entity
   	  end
   end

   private

   def issue_book_params
     params.require(:issue_book).permit(:user_id, :book_id, :issued_date)
   end

   def update_issue_book_params
     params.require(:issue_book).permit(:return_date)
   end

   def is_books_available
   	  book = Book.find_by(id: params[:issue_book][:book_id])
   	  unless book.available?
   	  	   render json: { error: 'Book is checked out' }, status: :unprocessable_entity
   	  end
   end

end
