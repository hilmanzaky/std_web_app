class ProductCategoriesController < ApplicationController

  def index
    @product_categories = ProductCategory.all
  end

  def show
    @product_category = ProductCategory.find(params[:id])
  end

  def new
    @product_category = ProductCategory.new
  end

  def create
    @product_category = ProductCategory.new(params[:product_category])

    respond_to do |format|
      if @product_category.save
        flash[:notice] = 'Kategori Barang telah disimpan'
        format.html { redirect_to product_categories_path }
      else
#        flash[:error] = 'Kategori Barang tidak dapat dihapus'
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @product_category = ProductCategory.find(params[:id])
  end

  def update
    @product_category = ProductCategory.find(params[:id])

    respond_to do |format|
      if @product_category.update_attributes(params[:product_category])
        format.html { redirect_to product_categories_path, notice: 'Data Barang telah diubah.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @product_category = ProductCategory.find(params[:id])

    if @product_category.destroy
      flash[:notice] = 'Kategori Barang telah berhasil dihapus'
    else
      flash[:error] = 'Kategori Barang tidak dapat dihapus'
    end

    respond_to do |format|
      format.html { redirect_to product_categories_path}
    end
  end

end