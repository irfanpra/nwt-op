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
      t.integer :views_count
      t.integer :max_duration

      t.integer :user_id
      t.integer :ad_type_id


      t.timestamps
    end
  end


end
