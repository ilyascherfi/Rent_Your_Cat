class CatsController < ApplicationController
  before_action :find_cat, only: %i[show edit update destroy]
  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def show
  end

  def edit
  end

  def create
    @cat = Cat.new(cat_params)
    if @list.save
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
    params.require(:cat).permit(:age, :race, :sexe, :location, :description, :user_id, :name, :price)
  end
end
