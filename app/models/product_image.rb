class ProductImage < ActiveRecord::Base
  attr_accessible :product_id, :image

  belongs_to :product
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
