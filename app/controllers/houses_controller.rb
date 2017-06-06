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
    house.room = params["room"]
    house.rate = params["rate"]
    house.number_of_bedrooms = params["nb1"]
    house.number_of_bathrooms = params["nb2"]
    house.start_date = params["start-date"]
    house.end_date = params["end-date"]
    house.availability = 1
    house.host = User.find_by(id: session["user_id"]).host
    house.save
    redirect_to "/", notice: "Successfully post new house #{house.building_name}"
  end

  def edit
    @house = House.find_by(id: params["id"])
    if session["user_id"].present? and User.find_by(id: session["user_id"]).email == "admin"
      return
    end
    if !session["user_id"].present? or User.find_by(id: session["user_id"]).renter.present? or !User.find_by(id: session["user_id"]).host.houses.include?(@house)
      redirect_to "/", notice: "Error:Cannot edit House hold by other user"
    end
  end

  def update
    house = House.find_by(id: params["id"])
    if session["user_id"].present? and User.find_by(id: session["user_id"]).email == "admin"
      
    else 
      if (not session["user_id"].present?) or User.find_by(id: session["user_id"]).renter.present? or house.host != User.find_by(id: session["user_id"]).host
        redirect_to "/", notice: "Error:Cannot edit House hold by other user"
        return
      end
    end
    house.building_name = params["name"]
    house.address = params["address"]
    house.room = params["room"]
    house.rate = params["rate"]
    house.number_of_bedrooms = params["nb1"]
    house.number_of_bathrooms = params["nb2"]
    house.start_date = params["start-date"]
    house.end_date = params["end-date"]
    house.availability = 1
    house.save
    redirect_to "/", notice: "Successfully edit house #{house.building_name}"
  end

  def destroy
    house = House.find_by(id: params["id"])
    if house.delete
      redirect_to "/", notice: "Successfully delete house #{house.building_name}"
    else
      redirect_to "/", notice: "Error:Delete unsuccess!"
    end
  end
end