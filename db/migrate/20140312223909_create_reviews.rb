class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content

      t.belongs_to :ad_offer
      t.belongs_to :user

      t.timestamps
    end
  end
end
