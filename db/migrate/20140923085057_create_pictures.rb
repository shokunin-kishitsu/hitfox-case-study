class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :description
      t.datetime :date
      t.references :monument
      t.string :image

      t.timestamps
    end
  end
end
