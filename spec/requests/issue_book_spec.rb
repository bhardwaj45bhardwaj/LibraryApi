require 'rails_helper'

RSpec.describe "IssueBooks", type: :request do

  let(:user) {User.create(name: "test_user", email: "test_user@gmail.com", address: "Pune")}
  let(:book) {Book.create(name: "test_book", author: "author", published_date: DateTime.now, uid: "1234567890")}

  describe 'POST #create' do
    it 'creates a new issue_book with available book' do
      expect {
        post '/api/issue_books', params: { issue_book: { user_id: user.id, book_id: book.id, issued_date: Date.today } }
      }.to change(IssueBook, :count).by(1)
      expect(book.reload.status).to eq("checked_out")
      
    end

    it 'failde to creates a new issue_book when book status is checked out' do

      IssueBook.create(user_id: user.id, book_id: book.id, issued_date: Date.today)
      
      expect {
        post '/api/issue_books', params: { issue_book: { user_id: user.id, book_id: book.id, issued_date: Date.today } }
      }.to change(IssueBook, :count).by(0)
      expect(response).to have_http_status(:unprocessable_entity)
      
    end
  end

  describe 'PUT #update' do
    
    let!(:issue_book) { IssueBook.create(user_id: user.id, book_id: book.id, issued_date: Date.today) }

    it 'return the issue_book' do
      put "/api/issue_books/#{issue_book.id}", params: {issue_book: { return_date: Date.today } }
      expect(issue_book.reload.return_date).to eq(Date.today)
      expect(book.status).to eq("available")
    end
  end
end
