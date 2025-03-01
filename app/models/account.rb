class Account < ApplicationRecord
  mount_uploader :image, ProfileImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes

  def full_name
    "#{first_name} #{last_name}"
  end

end
