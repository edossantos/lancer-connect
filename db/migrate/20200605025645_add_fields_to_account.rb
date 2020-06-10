class AddFieldsToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :country, :string
    add_column :accounts, :city, :string
    add_column :accounts, :github_url, :string
    add_column :accounts, :linkedin_url, :string
    add_column :accounts, :personal_website_url, :string
  end
end
