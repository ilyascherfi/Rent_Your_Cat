class Cat < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :reservations, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  SEXE = ["Male", "Female"]

  validates :name, :age, :race, :sexe, :location, :description, :price, presence: true
  validates :sexe, inclusion: { in: SEXE }
end
