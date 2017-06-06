require 'stripe'
class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find_by(id: params["id"])
  end

  def create
    reservation = Reservation.new
    reservation.house = House.find_by(id: params["house_id"])
    reservation.house.availability = 0
    reservation.house.save
    reservation.renter = Renter.find_by(id: params["renter_id"])
    reservation.update_at = Time.new
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
      if (user.renter.present? and user.renter == reservation.renter) or (user.host.present? and user.host == reservation.house.host) or user.email == "admin"
        reservation.house.availability = 1
        reservation.house.save
        reservation.delete
        redirect_to "/" , notice: "Cancel reservation successfully"
      else 
        redirect_to "/" , notice: "Error:Can't cancel other user's reservation"
      end
  
    else
      redirect_to "/", notice: "Error:Please login"
    end
  end

  def update
    reservation = Reservation.find_by(id: params["id"])

    if session["user_id"].present?
      user = User.find_by(id: session["user_id"])
      if user.host.present? and user.host == reservation.house.host
        reservation.house.availability = -1
        reservation.house.save
        redirect_to "/", notice: "Successfully confirm, you have selected #{reservation.renter.name} as your renter!"
      end
    end
  end
end