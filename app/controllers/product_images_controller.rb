class ProductImagesController < ApplicationController
#  before_filter :authenticate_user!
#  load_and_authorize_resource :only => :index

  def create
    @product_image = ProductImage.new(params[:product_image])

    respond_to do |format|
      if @product_image.save
          flash[:notice] = 'Gambar telah tersimpan'
          format.html { redirect_to edit_product_path(@product_image.product_id) }
      else
        flash[:error] = 'Gambar gagal disimpan'
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @product_image = ProductImage.find(params[:id])
    product = @product_image.product
    if @product_image.destroy
      flash[:notice] = 'Gambar telah berhasil dihapus'
    else
      flash[:error] = 'Gambar tidak dapat dihapus'
    end

    respond_to do |format|
      format.html { redirect_to edit_product_path(product) }
    end
  end
end
