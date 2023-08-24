class Cat < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  SEXE = ["Male", "Female"]
  RACE = ["Autres","Abyssinian","American Shorthair","Bengal","British Shorthair","Maine Coon","Persian","Persian","Ragdoll","Siamese","Sphynx","Scottish Fold","Russian Blue","Savannah","Burmese","Himalayan","Himalayan","Turkish Van","Norwegian Forest Cat","Devon Rex","Cornish Rex","Exotic Shorthair","Somali"]

  validates :name, :age, :race, :sexe, :location, :description, :price, presence: true
  validates :sexe, inclusion: { in: SEXE }
  validates :race, inclusion: { in: RACE }
  has_many_attached :photos

end
