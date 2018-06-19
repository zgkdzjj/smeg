class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :model_number

      # Field used to store basically which class it applies to
      t.string  :product_type

      t.text    :description
      t.text    :aesthetic

      t.text    :dimensions
      t.text    :finish

      t.text    :supplied_accessories
      t.text    :optional_accessories
      t.text    :safety
      t.text    :power

      t.text    :warranty
      t.boolean :status

      t.text    :feature_1
      t.text    :feature_2
      t.text    :feature_3
      t.text    :feature_4
      t.text    :feature_5

      t.jsonb   :data


      t.timestamps
    end
  end
end
