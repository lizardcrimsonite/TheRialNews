class AddDeviseRecoverableToUsers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:users, :reset_password_token)
      add_column :users, :reset_password_token, :string
    end

    unless column_exists?(:users, :reset_password_sent_at)
      add_column :users, :reset_password_sent_at, :datetime
    end
  end
end
