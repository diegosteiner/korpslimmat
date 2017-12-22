class CreateMailAliases < ActiveRecord::Migration
  def change
    create_table :mail_aliases do |t|
      t.string :email
      t.integer :aliasable_id
      t.string :aliasable_type

      t.timestamps
    end
  end
end
