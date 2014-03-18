class CreateAdBoughts < ActiveRecord::Migration
  def change
    create_table :ad_boughts do |t|
      t.date :date_start
      t.integer :duration

      t.timestamps
    end
  end
end
