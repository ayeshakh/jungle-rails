class AddLastName < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :last_name
    end
  end
end
