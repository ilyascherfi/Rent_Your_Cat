class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cats, dependent: :destroy
  has_many :revervations

  validates :first_name, :last_name, :address, :image_url, presence: true
end
