class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @cats = Cat.search_by_name_race_description_price_sexe_location(params[:query])
    else
      @cats = Cat.all
    end

    @users = User.all
    @markers = @cats.geocoded.map do |cat|
      {
        lat: cat.latitude,
        lng: cat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {cat: cat})
      }
    end
  end

  def profile
    @my_cats = current_user.cats
    @reservations_received = Reservation.where(cat: @my_cats)
    @reservations_sent = Reservation.where(user: current_user)

  end
end
