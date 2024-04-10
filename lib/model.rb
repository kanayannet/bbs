
require 'active_record'
require 'erb'
require 'yaml'

CONFIG = YAML.safe_load(
  ERB.new(File.read('./config/database.yml')).result,
  aliases: true
)

class Article < ActiveRecord::Base
  establish_connection(CONFIG['bbs'])
end
