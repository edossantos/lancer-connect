class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :account
  has_many :likes
end
