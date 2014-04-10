class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|

      t.string :email_id
      t.integer :email_read_flag
      t.datetime :email_read_flag_time
      t.integer :page_visited_flag
      t.datetime :page_visited_flag_time
      t.integer :signup_flag
      t.datetime :signup_flag_time

      t.timestamps
    end
  end
end
