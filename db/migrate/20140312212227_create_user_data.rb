class CreateUserData < ActiveRecord::Migration
  def self.up
    create_table :user_data do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.text :description
      t.boolean :is_activated

      t.belongs_to :user_type

      t.timestamps
    end
  end

  def self.down
    drop_table :user_data
  end
end
