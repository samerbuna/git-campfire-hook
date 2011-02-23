#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), 'notification')

if ARGV.length != 3
  puts "Usage:  #{$0} ref oldrev newrev"
  exit
end

config_data = `git config --get-regexp hooks.campfire`.lines
config = config_data.inject({}) do |hash, line|
  line.match(/^hooks\.campfire\.([a-z\-\.]+)\s+(.+)$/)
  hash.merge($1.to_sym => $2)
end

CFN.new :config => config, :ref_name => ARGV[0],
        :old_revision => `git rev-parse #{ARGV[1]}`.strip,
        :new_revision => `git rev-parse #{ARGV[2]}`.strip
