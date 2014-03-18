class CreatePasswordRecoveryTokens < ActiveRecord::Migration
  def self.up
    create_table :password_recovery_tokens do |t|
      t.string :token

      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :password_recovery_tokens
  end
end
