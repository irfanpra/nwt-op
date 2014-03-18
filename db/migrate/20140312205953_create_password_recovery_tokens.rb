class CreatePasswordRecoveryTokens < ActiveRecord::Migration
  def self.up
    create_table :password_recovery_tokens do |t|
      t.belongs_to :user
      t.string :token

      t.timestamps
    end
  end

  def self.down
    drop_table :password_recovery_tokens
  end
end
