class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.float :price
      t.string :unit
      t.boolean :is_hidden
      t.float :duarion
      t.integer :views_count
      t.datetime :date_last_edit

      t.belongs_to :user_data
      t.belongs_to :ad_type

      t.timestamps
    end
  end
end
