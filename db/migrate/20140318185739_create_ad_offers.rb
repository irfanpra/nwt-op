class CreateAdOffers < ActiveRecord::Migration
  def change
    create_table :ad_offers do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.decimal :price
      t.string :unit
      t.datetime :date_start
      t.datetime :date_end
      t.boolean :is_hidden
      t.int :views_count
      t.integer :max_duration

      t.timestamps
    end
  end
end
