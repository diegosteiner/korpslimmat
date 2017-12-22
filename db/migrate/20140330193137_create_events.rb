class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :from
      t.datetime :to
      t.string :place
      t.string :organizer

      t.timestamps
    end
  end
end
