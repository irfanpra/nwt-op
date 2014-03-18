class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.datetime :date_subscribed

      t.integer :user_id
      t.integer :user_id

      t.timestamps
    end
  end
end
