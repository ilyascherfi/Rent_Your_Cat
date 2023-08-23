class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cats = Cat.all
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end
end
