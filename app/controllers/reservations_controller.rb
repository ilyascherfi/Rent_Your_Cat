class ReservationsController < ApplicationController

  def show
  end

  def new
    @reservation = Reservation.new
    @cat = Cat.find(params[:cat_id])
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.cat = @cat

    if @reservation.save!
      redirect_to profile_path, notice: "reservation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to cats_path(@reservation.cat)
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.update(statut: true)
    redirect_to profile_path
  end

  def reject
    @reservation = Reservation.find(params[:id])
    @reservation.update(statut: false)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status, :start_date, :end_date, :total_price, :cat_id, :user_id)
  end
end
