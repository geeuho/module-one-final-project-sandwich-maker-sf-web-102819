require 'bundler'
require 'pry'
require 'rest-client'
require 'json'

Bundler.require

# ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_all 'lib'
require_all 'app'
# require_all '../app/models'
require_all 'lib'
ActiveRecord::Base.logger = nil
