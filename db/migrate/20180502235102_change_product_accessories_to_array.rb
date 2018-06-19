class ChangeProductAccessoriesToArray < ActiveRecord::Migration[5.0]
  def up
    change_column :products, :supplied_accessories, :text, array: true, default: [], using: "(string_to_array(supplied_accessories, ','))"
    change_column :products, :optional_accessories, :text, array: true, default: [], using: "(string_to_array(optional_accessories, ','))"

    Product.update_all(supplied_accessories: [], optional_accessories: [])
  end

  def down
    change_column :products, :supplied_accessories, :text
    change_column :products, :optional_accessories, :text
  end
end
