class AddOmniauthToChallengers < ActiveRecord::Migration[5.1]
  def change
    add_column :challengers, :provider, :string
    add_column :challengers, :uid, :string
  end
end
