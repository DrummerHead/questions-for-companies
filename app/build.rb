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

def dash(string)
  string.gsub(/\s+/, '-')
end


interpolated_text = File.open(data["template_path"], "rb", encoding: 'UTF-8').read.each_line.map do |line|
  line.gsub(/{{([^}]*)}}/) do
    path_array = $1.split('.')
    get_recursive_data data, path_array
  end
end.reduce(:+)

questions_file_name = "#{data['date']}--#{dash(data['company']['name'])}--#{data['me']['name']}-#{data['me']['surname']}.#{data['file_metadata']['extension']}"

File.write("../questions/#{questions_file_name}", interpolated_text)

puts "\nQuestions file was written at\n../questions/#{questions_file_name}\n\n"
