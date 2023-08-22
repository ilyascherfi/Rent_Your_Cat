class CatsController < ApplicationController

  def index
  end

  def show

  end

  def new
    @cat = Cat.new
    # redirect_to cat_path(@cat)
  end

end
