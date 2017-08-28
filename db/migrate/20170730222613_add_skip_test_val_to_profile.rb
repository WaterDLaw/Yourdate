class AddSkipTestValToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :skip_test_val, :boolean
  end
end
