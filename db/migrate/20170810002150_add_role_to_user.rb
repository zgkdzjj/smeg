class AddRoleToUser < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE TYPE user_role AS ENUM ('admin', 'user');
    SQL
    add_column :users, :role, :user_role, index: true
  end

  def down
    remove_column :users, :role

    execute <<-SQL
      DROP TYPE user_role;
    SQL
  end
end
