class CreateAdTypes < ActiveRecord::Migration
  def change
    create_table :ad_types do |t|
      t.string,description :type

      t.timestamps
    end
  end
end
