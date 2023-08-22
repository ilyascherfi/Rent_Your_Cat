class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable;

  has_many :revervations, through: :cats, dependent: :destroy
  has_many :cats, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :address, presence: true

end
