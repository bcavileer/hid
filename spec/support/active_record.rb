require 'sqlite3'
require 'active_record'
require 'database_cleaner'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

ActiveRecord::Migration.create_table :identities do |t|
  t.string :input, null: false
  t.string :identity, null: false
  t.string :id_type
end

ActiveRecord::Migration.create_table :records do |t|
  t.string :input, null: false
  t.string :id_type
end
