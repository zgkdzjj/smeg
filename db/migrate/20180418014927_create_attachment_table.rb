class CreateAttachmentTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :product_images

    create_table :attachments do |t|
      t.string :type
      t.string :attachment
      t.string :attachment_cache

      t.timestamps
    end

    create_table :product_attachments do |t|
      t.references :product
      t.references :attachment
    end

    add_column :products, :cover_image, :string
  end

  def down
    drop_table :attachments
    drop_table :product_attachments

    remove_column :products, :cover_image

    create_table :product_images do |t|
      t.string :photo
      t.integer :product_id
      t.timestamps
    end
  end

end
