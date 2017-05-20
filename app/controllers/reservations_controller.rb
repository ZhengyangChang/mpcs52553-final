class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find_by(id: params["id"])
  end

  def create
    reservation = Reservation.new
    reservation.house = House.find_by(id: params["house_id"])
    reservation.renter = Renter.find_by(id: params["renter_id"])
    if reservation.save
      redirect_to "/", notice: "Successfully reserve house #{reservation.house.building_name}"
    else
      redirect_to "/", notice: "Error:oops, something bad happened"
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params["id"])
    if session["user_id"].present?
      user = User.find_by(id: session["user_id"])
      if user.renter.present?
        if user.renter == reservation.renter
          reservation.delete
          redirect_to "/" , notice: "Cancel reservation successfully"
        else
          redirect_to "/" , notice: "Error:Can't cancel other user's reservation"
        end
      end
    else
      redirect_to "/", notice: "Error:Please login"
    end
  end
    
end