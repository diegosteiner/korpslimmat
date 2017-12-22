class CreateEventSignups < ActiveRecord::Migration
  def change
    create_table :event_signups do |t|
      t.string :name
      t.references :event
      t.text :options

      t.timestamps
    end
  end
end
