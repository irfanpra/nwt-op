class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content

      t.belongs_to :ad
      t.belongs_to :user_data

      t.timestamps
    end
  end
end
