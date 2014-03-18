class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :description

      t.belongs_to :user

      t.timestamps
    end
  end
end
