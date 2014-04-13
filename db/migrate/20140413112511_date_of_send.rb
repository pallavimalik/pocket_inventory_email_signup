class DateOfSend < ActiveRecord::Migration
  def change
    add_column :visitors, :email_date, :string
  end
end
