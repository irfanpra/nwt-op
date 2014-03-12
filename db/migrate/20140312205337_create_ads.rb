class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string,subtitle :title

      t.timestamps
    end
  end
end
