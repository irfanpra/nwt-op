class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.datetime :date_subscribed

      t.belongs_to :user_data

      t.timestamps
    end
  end
end
