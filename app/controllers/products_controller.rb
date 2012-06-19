class ProductsController < ApplicationController
#  before_filter :authenticate_user!
#  load_and_authorize_resource :only => :index

  def index
#    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @products = Product.joins("LEFT JOIN product_categories pc ON products.product_category_id = pc.id").
                        select("pc.name as product_category_name, products.name, products.description, products.id")
  end

  def new
    @product = Product.new
    @product_categories = ProductCategory.all
  end

  def create
    @product = Product.new(params[:product])
    product_images = []

    respond_to do |format|
      if @product.save
        product_images << { :product_id => @product.id, :image => params[:image_1] } unless params[:image_1].blank?
        product_images << { :product_id => @product.id, :image => params[:image_2] } unless params[:image_2].blank?
        product_images << { :product_id => @product.id, :image => params[:image_3] } unless params[:image_3].blank?

        success = ProductImage.create(product_images)
        
        if success
          flash[:notice] = 'Data Barang telah tersimpan'
        else
          flash[:error] = 'Gambar gagal disimpan'
        end
        format.html { redirect_to products_path }
      else
        flash[:error] = 'Data Barang gagal disimpan'
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
    @product_categories = ProductCategory.all
    @product_images = @product.product_images
    @product_image = ProductImage.new(:product_id => params[:id])
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to product_path, notice: 'Data Barang telah diubah.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def show
    @product = Product.joins("LEFT JOIN product_categories pc ON products.product_category_id = pc.id").
                       select("pc.name as product_category_name, products.name as name, products.description, products.id").
                       where("products.id = ?", params[:id]).
                       first
    @product_images = @product.product_images
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      flash[:notice] = 'Barang telah berhasil dihapus'
    else
      flash[:error] = 'Barang tidak dapat dihapus'
    end

    respond_to do |format|
      format.html { redirect_to products_path}
    end
  end
end
