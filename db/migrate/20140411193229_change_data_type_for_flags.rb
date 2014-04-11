class ChangeDataTypeForFlags < ActiveRecord::Migration
  def change
    change_column :visitors, :page_visited_flag, 'boolean USING CAST(page_visited_flag AS boolean)', :default => false
    change_column :visitors, :signup_flag, 'boolean USING CAST(signup_flag AS boolean)', :default => false
  end
end
