require 'data_mapper'
require 'dm-core'
require 'dm-yaml-adapter'
require 'dm-mysql-adapter'
require 'dm-aggregates'
require 'dm-sqlite-adapter'

DataMapper.setup(:default, 'yaml:db')

Dir.glob("#{Rails.root}/app/models_datamappers/*.rb").each { |c| require_relative c }

DataMapper.finalize
DataMapper.auto_upgrade!
