class RenameSignToNameHoroscopes < ActiveRecord::Migration
  def up
    rename_column :horoscopes, :sign, :name
    add_column :horoscopes, :solutions_feed, :string
  end

  def down
    rename_column :horoscopes, :name, :sign
    remove_column :horoscopes, :solutions_feed, :string
  end
end
