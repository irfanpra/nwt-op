class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :path
      t.belongs_to :ad

      t.timestamps
    end
  end
end
