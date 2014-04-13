class EnteredEmail < ActiveRecord::Migration
  def change
    add_column :visitors, :entered_email, :string
    add_column :visitors, :ip_address, :string
  end
end
