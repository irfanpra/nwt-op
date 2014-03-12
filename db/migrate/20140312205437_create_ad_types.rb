class CreateAdTypes < ActiveRecord::Migration
  def change
    create_table :ad_types do |t|
      t.string :description 
      t.string :type

      t.timestamps
    end
  end
end
