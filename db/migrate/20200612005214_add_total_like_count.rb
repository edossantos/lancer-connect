class AddTotalLikeCount < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :total_like_count, :integer
  end
end
