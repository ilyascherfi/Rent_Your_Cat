class Cat < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :reservations, dependent: :destroy
  SEXE = ["Male","Femelle"]
  RACE = ["Abyssin","Angora turc","Bengal","Balinais","Bleu russe","Bombay", "Chat de gouttière","Sphynx","Sibérien"]


  validates :name, :age, :race, :sexe, :location, :description, :price, presence: true
  validates :sexe, inclusion: { in: SEXE }
  validates :race, inclusion: { in: RACE }

end
