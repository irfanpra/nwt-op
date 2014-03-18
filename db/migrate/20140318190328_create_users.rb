class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :contact
      t.string :email
      t.text :description
      t.boolean :is_activated

      t.belongs_to :user_type

      t.belongs_to :subscription


      t.timestamps
    end
  end
end
