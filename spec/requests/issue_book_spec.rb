require 'rails_helper'

RSpec.describe "IssueBooks", type: :request do

  describe 'POST #create' do
    it 'creates a new issue_book' do
      expect {
        post :create, params: { issue_book: { user_id: 1, book_id: 1, issue_date: Date.today } }
      }.to change(IssueBook, :count).by(1)
    end
  end

  describe 'PUT #update' do
    let!(:issue_book) { create(:borrowing) }

    it 'updates the issue_book' do
      put :update, params: { id: issue_book.id, issue_book: { return_date: Date.today } }
      expect(issue_book.reload.return_date).to eq(Date.today)
    end
  end
end
