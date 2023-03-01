class AddFieldNameToEventspaces < ActiveRecord::Migration[7.0]
  def change
    add_column :eventspaces, :price, :integer
  end
end
