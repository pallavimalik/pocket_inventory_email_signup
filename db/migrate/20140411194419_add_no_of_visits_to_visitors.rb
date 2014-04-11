class AddNoOfVisitsToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :no_of_visits, :integer
  end
end
