class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :content

      t.belongs_to :ad
      t.belongs_to :user_data

      t.timestamps
    end
  end
end
