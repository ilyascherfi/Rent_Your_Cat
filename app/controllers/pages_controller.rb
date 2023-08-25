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
    @reservations_received = Reservation.where(cat: @my_cats)
    @reservations_sent = Reservation.where(user: current_user)

  end

end
