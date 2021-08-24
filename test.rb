#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Story title:'

title = gets.chomp
title = title.gsub(/([^A-z\d\s]|(\s+$))/, '').gsub(/\s+/, ' ').gsub(/\s/, '-').downcase

puts 'Story number:'

number = gets.chomp
number = number[1..-1] if number[0] == '#'

puts 'Story type (enter for "feature"):'

type = gets.chomp
type = 'feature' if type.length.zero?

puts "#{type}/#{title}-#{number}"
