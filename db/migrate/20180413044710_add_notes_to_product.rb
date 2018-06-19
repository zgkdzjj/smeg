class AddNotesToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :notes, :text
    add_column :products, :ean, :text
  end
end
