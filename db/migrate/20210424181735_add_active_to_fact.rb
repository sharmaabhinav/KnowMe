class AddActiveToFact < ActiveRecord::Migration[6.1]
  def change
    add_column :facts, :active, :boolean
  end
end
