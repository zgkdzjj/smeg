class ChangeFeatureTypeName < ActiveRecord::Migration[5.0]
  def change
    rename_column :features, :type, :feature_type
  end
end
