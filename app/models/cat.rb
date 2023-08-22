class Cat < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  SEXE = ["Male","Female"]

  validates :name, :age, :race, :sexe, :location, :description, :image_url, :price, presence: true
  validates :sexe, inclusion: { in: SEXE }
end
