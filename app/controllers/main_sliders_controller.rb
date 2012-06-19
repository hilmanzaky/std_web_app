class MainSlidersController < ApplicationController
  before_filter :authenticate_user!
  #  load_and_authorize_resource :only => :index

  def index
    @main_sliders = MainSlider.all
  end

  def show
    @main_slider = MainSlider.find(params[:id])
  end

  def new
    @main_slider = MainSlider.new
  end

  def create
    @main_slider = MainSlider.new(params[:main_slider])
    
    respond_to do |format|
      if @main_slider.save
        #flash[:notice] = 'Gambar dan deskripsi telah tersimpan'
        format.html { redirect_to main_sliders_path, notice: 'Gambar dan deskripsi telah tersimpan' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @main_slider = MainSlider.find(params[:id])
  end

  def update
    @main_slider = MainSlider.find(params[:id])

    respond_to do |format|
      if @main_slider.update_attributes(params[:main_slider])
        format.html { redirect_to main_sliders_path, notice: 'Deskripsi telah diubah.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @main_slider = MainSlider.find(params[:id])

    if @main_slider.destroy
      flash[:notice] = 'Gambar telah berhasil dihapus'
    else
      flash[:error] = 'Gambar tidak dapat dihapus'
    end

    respond_to do |format|
      format.html { redirect_to main_sliders_path}
    end
  end
end
