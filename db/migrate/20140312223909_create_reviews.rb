class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content

      t.integer :ad_offer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
