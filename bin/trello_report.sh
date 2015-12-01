#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), "../lib")

require 'trello_reporter'

TrelloReporter::Runner.new(ARGV, ENV).run
