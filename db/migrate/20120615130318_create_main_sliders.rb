class CreateMainSliders < ActiveRecord::Migration
  def change
    create_table :main_sliders do |t|
      t.text :description

      t.timestamps
    end
  end
end
