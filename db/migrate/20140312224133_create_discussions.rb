class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :content

      t.belongs_to :ad_offer
      t.belongs_to :user

      t.timestamps
    end
  end
end
