class RenameProductTypeToTypeOnProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :product_type, :type
  end
end
