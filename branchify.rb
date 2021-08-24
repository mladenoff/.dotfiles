#!/usr/bin/env ruby
# frozen_string_literal: true

# V1
# type = ARGV[2] || 'feature'
# title = ARGV[0].gsub(/([^A-z\s]|(\s+$))/, '').gsub(/\s+/, ' ').gsub(/\s/, '-').downcase
# number = ARGV[1]
# puts "#{type}/#{title}-#{number}"

# V2
# if /^\d+$/.match? ARGV[-1]
#   type = 'feature'
#   number = ARGV[-1]
#   title = ARGV[0..-2]
# else
#   type = ARGV[-1]
#   number = ARGV[-2]
#   title = ARGV[0..-3]
# end
# title.map! { |word| word.gsub(/[^A-z]/, '') }
# title = title.join('-').gsub(/-+/, '-').downcase

# V3
puts 'Story title:'

title = gets.chomp
title = title.gsub(/([^A-z\d\s]|(\s+$))/, '').gsub(/\s+/, ' ').gsub(/\s/, '-').downcase

puts 'Story number:'

number = gets.chomp
number = number[1..-1] if number[0] == '#'

puts 'Story type (enter for "feature"):'

type = gets.chomp
type = 'feature' if type.length.zero?

story = "#{type}/#{title}-#{number}"

puts `git checkout -b #{story}`.chomp
