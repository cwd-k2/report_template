require 'bundler/setup'

require 'pathname'
require 'shellwords'
require 'fileutils'

# require 'pycall/import'
# include PyCall::Import

PROJECT_ROOT = Pathname.new(File.dirname __FILE__).expand_path
