class Cat < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :age, :race, :sexe, :location, :description, :price, :image_url, presence: true
end
