class ChangeEventSignupsOptions < ActiveRecord::Migration
  def change
    rename_column :event_signups, :options, :options_serialized
  end
end
