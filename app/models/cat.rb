class Cat < ApplicationRecord
  include PgSearch::Model
  has_many_attached :photos
  belongs_to :user
  has_many :reservations, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  SEXE = ["Male", "Female"]
  RACE = ["Autre","Abyssinian","American Shorthair","Bengal","British Shorthair","Maine Coon","Persian","Persian","Ragdoll","Siamese","Sphynx","Scottish Fold","Russian Blue","Savannah","Burmese","Himalayan","Himalayan","Turkish Van","Norwegian Forest Cat","Devon Rex","Cornish Rex","Exotic Shorthair","Somali"]

  validates :name, :age, :race, :sexe, :location, :description, :price, presence: true
  validates :sexe, inclusion: { in: SEXE }
  validates :race, inclusion: { in: RACE }

  pg_search_scope :search_by_name_race_description_price_sexe_location,
    against: [ :name, :race, :description, :price, :sexe, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
