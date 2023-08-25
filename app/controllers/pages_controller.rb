class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cats = Cat.all
    @users = User.all
    @markers = @cats.geocoded.map do |cat|
      {
        lat: cat.latitude,
        lng: cat.longitude
      }
    end
  end

  def profile
    @my_cats = current_user.cats
    @reservations = Reservation.where(cat: @my_cats)
  end

end
