class AddAdminToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :admin, :boolean, default: false
  end
end
