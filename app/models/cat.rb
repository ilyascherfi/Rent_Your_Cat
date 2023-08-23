class Cat < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :reservations, dependent: :destroy
  SEXE = ["Male","Female"]

  validates :name, :age, :race, :sexe, :location, :description, :price, presence: true
  validates :sexe, inclusion: { in: SEXE }
end
