class CreateMonuments < ActiveRecord::Migration
  def change
    create_table :monuments do |t|
      t.string :name
      t.string :description
      t.references :collection, index: true
      t.references :category, index: true
    end
  end
end
