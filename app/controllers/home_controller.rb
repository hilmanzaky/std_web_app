class HomeController < ApplicationController
  def index
#    @users = User.all
    @main_sliders = MainSlider.all
  end
end
