class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.date :published_date
      t.integer :uid, limit: 8
      t.integer :status, default: 0
      t.timestamps
    end
  end
  
end
