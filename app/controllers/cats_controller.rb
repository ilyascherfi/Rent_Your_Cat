class CatsController < ApplicationController
  before_action :find_cat, only: %i[show edit update destroy]
  def index
    @cats = Cat.all
    
  end


  def show
    @reservation = Reservation.new
  end

  def new
    @cat = Cat.new
  end

  def edit
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
    if @cat.save
      redirect_to cat_path(@cat), notice: "cat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @cat.update(cat_params)
      redirect_to cat_path(@cat), notice: "cat was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cat.destroy
    redirect_to root_path, notice: "cat was successfully destroyed.", status: :see_other
  end

  private

  def find_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:age, :race, :sexe, :location, :description, :user_id, :name, :price, photos: [])
  end
end
