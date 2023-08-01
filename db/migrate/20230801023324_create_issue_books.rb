class CreateIssueBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :issued_date
      t.datetime :return_date
      t.timestamps
    end
  end
  
end
