class Product < ActiveRecord::Base
  attr_accessible :description, :name, :product_category_id

  belongs_to :product_category
  has_many :product_images, :dependent => :destroy
end
