class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :path

      t.integer :ad_bought_id

      t.timestamps
    end
  end
end
