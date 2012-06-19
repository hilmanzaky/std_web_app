class AddAttachmentImageToMainSliders < ActiveRecord::Migration
  def self.up
    add_column :main_sliders, :image_file_name, :string
    add_column :main_sliders, :image_content_type, :string
    add_column :main_sliders, :image_file_size, :integer
    add_column :main_sliders, :image_updated_at, :datetime
  end

  def self.down
    remove_column :main_sliders, :image_file_name
    remove_column :main_sliders, :image_content_type
    remove_column :main_sliders, :image_file_size
    remove_column :main_sliders, :image_updated_at
  end
end
