class CreatePhotoTable < ActiveRecord::Migration
  def change
     create_table :photos do |t|
      t.string  :name
      t.string  :image
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
