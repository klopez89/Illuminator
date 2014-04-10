require 'optparse'
require 'pathname'

require File.join(File.expand_path(File.dirname(__FILE__)), '/classes/AutomationRunner.rb')
require File.join(File.expand_path(File.dirname(__FILE__)), '/classes/AutomationArgumentParserFactory.rb')

workspace = Dir.pwd

options = {}
parserFactory = AutomationParserFactory.new()
parserFactory.prepare()
parser = parserFactory.buildParser(options, "xpatonsjdi#bzl#fek#crvmw")

parser.parse! ARGV

puts options
AutomationRunner.runWithOptions options, workspace

