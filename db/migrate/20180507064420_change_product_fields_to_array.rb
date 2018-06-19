class ChangeProductFieldsToArray < ActiveRecord::Migration[5.0]
  def up
    change_column :products, :finish, :text, array: true, default: [], using: "(string_to_array(finish, ','))"
    change_column :products, :safety, :text, array: true, default: [], using: "(string_to_array(safety, ','))"
  end

  def down
    change_column :products, :finish, :string
    change_column :products, :safety, :string
  end
end
