class CreateFeatures < ActiveRecord::Migration[5.0]
  def up
    create_table :features do |t|
      t.string :name
      t.string :type
      t.string :long_description
      t.string :short_description

      t.timestamps
    end

    create_table :product_features do |t|
      t.references :product
      t.references :feature

      t.timestamps
    end

    remove_column :products, :feature_1
    remove_column :products, :feature_2
    remove_column :products, :feature_3
    remove_column :products, :feature_4
    remove_column :products, :feature_5
  end

  def down
    drop_table :product_features
    drop_table :features

    add_column :products, :feature_1, :string
    add_column :products, :feature_2, :string
    add_column :products, :feature_3, :string
    add_column :products, :feature_4, :string
    add_column :products, :feature_5, :string
  end
end
