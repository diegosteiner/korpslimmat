class CreateGroupFunctions < ActiveRecord::Migration
  def change
    create_table :group_functions, id: false  do |t|
      t.references :group, index: true
      t.references :person, index: true
      t.integer :functions_mask

      t.timestamps
    end
  end
end
