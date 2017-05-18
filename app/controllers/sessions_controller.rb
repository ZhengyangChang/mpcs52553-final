class SessionsController < ApplicationController

  def destroy
    reset_session
    redirect_to "/", notice: "See ya!"
  end

  def new
    # render 'new'
  end

  def create
    user = User.find_by(email: params["email"])
    if user.present?
      if user.authenticate(params["password"])
        session["user_id"] = user.id
        if user.renter.present?
          redirect_to "/", notice: "#{user.renter.name} Welcome back!"
        else
          redirect_to "/", notice: "#{user.host.name} Welcome back!"
        end
      else
        redirect_to "/login", notice: "Error:Wrong password, try again"
      end
    else
      redirect_to "/login", notice: "Error:No such user"
    end
  end
end