require_relative 'application'

puts "Application process pid: #{Process.pid}"

run Application.new
