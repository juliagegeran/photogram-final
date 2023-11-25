class ChangeColumnTypes < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :comments_count, :integer
    change_column :users, :likes_count, :integer
    change_column :photos, :caption, :text
    change_column :photos, :comments_count, :integer
    change_column :photos, :likes_count, :integer
    change_column :comments, :body, :text
    
  end
end
