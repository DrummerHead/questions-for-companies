#!/usr/bin/env ruby

require 'yaml'
data = YAML.load_file 'config.yml'


def get_recursive_data(data, path_array)
  if path_array.length == 0
    return data
  end
  subdata = data[path_array.shift]
  get_recursive_data subdata, path_array
end


interpolated_text = File.open(data["template"], "rb").read.each_line.map do |line|
  line.gsub(/{{([^}]*)}}/) do
    path_array = $1.split('.')
    get_recursive_data data, path_array
  end
end.reduce(:+)


File.write("../questions/#{data['file_metadata']['name']}.#{data['file_metadata']['extension']}", interpolated_text)

