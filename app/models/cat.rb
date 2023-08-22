class Cat < ApplicationRecord
  belongs_to :user

  validates :name, :age, :race, :sexe, :location, :description, :price, presence: true
end
