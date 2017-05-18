require 'action_view'
include ActionView::Helpers::NumberHelper

class UsersController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    @user = User.new
    @user.email = params["email"]
    @user.password = params["password"]
    case params["type"]
    when "0"
      @renter = Renter.new
      @renter.user = @user
      @renter.name = params["name"]
      @renter.phone = number_to_phone params["phone"]
      @user.renter = @renter
      if @renter.save && @user.save
        redirect_to "/", notice: "Thanks for signing up as renter!"
      else
        redirect_to "/users/new", notice: "Error:Email address already taken."
      end
    when "1"
      @host = Host.new
      @host.user = @user
      @host.name = params["name"]
      @host.phone = params["phone"]
      @user.host = @host
      if @host.save && @user.save
         redirect_to "/", notice: "Thanks for signing up as host!"
      else
        redirect_to "/users/new", notice: "Error:Email address already taken."
      end     
    else
      redirect_to "/users/new", notice: "Error"
    end
  end

  def show
    @user = User.find_by(id: params["id"])
    if @user == nil
      redirect_to "/", notice: "No such user"
    end
  end

  def update
    user = User.find_by(id: params["id"])
    email = params["email"]
    phone = params["phone"]

    if email.present?
      user.email = email
    end
    user.save

    if phone.present?
      if user.host.present?
        user.host.phone = number_to_phone phone
        user.host.save
      else
        user.renter.phone = number_to_phone phone
        user.renter.save
      end
    end

    redirect_to "/users/#{params["id"]}"
  end
end