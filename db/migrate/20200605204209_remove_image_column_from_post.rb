class RemoveImageColumnFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :image
  end
end
