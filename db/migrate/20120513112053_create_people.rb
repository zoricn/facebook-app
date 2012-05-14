class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :uid
      t.string :sign

      t.timestamps
    end
  end
end
