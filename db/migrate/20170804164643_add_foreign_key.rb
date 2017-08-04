class AddForeignKey < ActiveRecord::Migration
  def change
    add_foreign_key :reviews, :products
    add_foreign_key :reviews, :users
  end


end
