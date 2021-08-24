#!/usr/bin/env ruby
# frozen_string_literal: true

class Branchifier # rubocop:disable Style/Documentation
  attr_reader :type, :title, :number

  def self.branchify
    Branchifier.new.branchify
  end

  def branchify
    puts 'Story title:'

    self.title = gets.chomp

    puts 'Story number:'

    self.number = gets.chomp

    puts 'Story type (enter for "feature"):'

    self.type = gets.chomp

    puts `git checkout -b #{story}`.chomp
  end

  def title=(title)
    @title = title.gsub(/[^A-z\d\s]/, '')
    @title.gsub!(/\s+/, '-')
    @title.gsub!(/-+$/, '')
    @title.downcase!
  end

  def number=(number)
    @number = number.gsub(/[^\d]/, '')
  end

  def type=(type)
    @type = 'feature' if type.empty?
  end

  def story
    return "#{type}/#{title}" if number.empty?

    "#{type}/#{title}-#{number}"
  end
end

Branchifier.branchify
