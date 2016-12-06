require 'sinatra/activerecord'
require 'sinatra'

set :database, {adapter: "sqlite3", database: "database.db"}

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end
