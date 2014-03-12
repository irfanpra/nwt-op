class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :subtitle
      t.string :title
      t.text :description
      t.doble :price
      t.string :unit
      t.boolean :is_hidden
      t.double :duration
      t.datetime :date_start
      t.datetime :date_end
      t.integer :views_count
      t.timestamps
    end
  end
end
