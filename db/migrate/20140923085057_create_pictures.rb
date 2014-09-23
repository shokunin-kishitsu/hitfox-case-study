class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :description
      t.datetime :date
      t.references :monument
    end
    add_column :pictures, :image, :oid
  end
end
