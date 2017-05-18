class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find_by(id: params["id"])
  end

  def new
  end

  def create
    house = House.new
    house.building_name = params["name"]
    house.address = params["address"]
    house.rate = params["rate"]
    house.number_of_bedrooms = params["nb1"]
    house.number_of_bathrooms = params["nb2"]
    house.availability = 1
    house.host = User.find_by(id: session["user_id"]).host
    house.save
    redirect_to "/", notice: "Successfully post new house #{house.building_name}"
  end
end