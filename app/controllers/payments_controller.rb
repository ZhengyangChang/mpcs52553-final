class PaymentsController < ApplicationController
  def show
    @reservation = Reservation.find_by(id: params["id"])
    days = Date.parse(@reservation.house.end_date) - Date.parse(@reservation.house.start_date)
    @amount = (@reservation.house.rate * 100 * days.to_int / 30.0).to_int / 100.0
    if not session["user_id"].present? or not User.find_by(id: session["user_id"]).renter.present? or User.find_by(id: session["user_id"]).renter != @reservation.renter
      redirect_to "/", notice:"Error:Cannot pay bill not reserved by you"
    end
    if @reservation.house.availability != -1
      redirect_to "/", notice:"Error:House is not ready to pay yet"
    end
  end

  def create
    reservation = Reservation.find_by(id: params["reservation_id"])
    if params["stripe_token"] == nil
      return
    end
    Stripe.api_key = "sk_test_yFqrExDrIDulKNBqEfPa9MkQ"

    if session["user_id"].present?
      user = User.find_by(id: session["user_id"])
      if user.renter.present? and user.renter == reservation.renter
        stripe_token = params["stripe_token"]
        charge = Stripe::Charge.create(
          :amount => (params["amount"].to_f * 100).to_i ,
          :currency => "usd",
          :description => "Renting charge",
          :source => stripe_token,
        )
        reservation.house.availability = -2
        reservation.house.save
        credit = reservation.house.host.credit.to_f + params["amount"].to_f
        reservation.house.host.credit = credit
        reservation.house.host.save

      end
    end

    redirect_to "/", notice:"Payment Success"

  end

  skip_before_filter :verify_authenticity_token 
end