class CreateAdBoughts < ActiveRecord::Migration
  def change
    create_table :ad_boughts do |t|
      t.date :date_start
      t.integer :duration

      t.belongs_to :ad_offer

      t.timestamps
    end
  end
end
