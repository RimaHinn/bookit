class AddDescriptionToEventspaces < ActiveRecord::Migration[7.0]
  def change
    add_column :eventspaces, :description, :text
  end
end
