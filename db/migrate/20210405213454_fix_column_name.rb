class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :users, :name, :first_name
  end
end
