class StaticsController < ApplicationController

  before_action :authenticate_user!, except: [:home]

  def home
    if user_signed_in?
      redirect_to :myprofile
    end
  end

end
