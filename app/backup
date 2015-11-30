#!/usr/bin/env ruby

require 'yaml'
data = YAML.load_file 'config.yml'

def dash(string)
  string.gsub(/\s+/, '-')
end

backup_file_name = "#{data['date']}--#{dash(data['company']['name'])}--config.yml"

%x[cp config.yml config-backup/#{backup_file_name}]
%x[cp config.example.yml config.yml]

puts "\nconfig.yml backed up at ./config-backup as #{backup_file_name}"
puts "config.yml has been reset using config.example.yml info\n"
