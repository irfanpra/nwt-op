class CreateAdTypes < ActiveRecord::Migration
  def change
    create_table :ad_types do |t|
      t.string :ad_type

      t.timestamps
    end
  end
end
