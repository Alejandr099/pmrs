class AddAvatarToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts,:avatar, :string
    add_column :accounts, :company, :string
  end
end
