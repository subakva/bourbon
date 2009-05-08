require 'rake/clean'
require 'rake/testtask'
require 'fileutils'

task :default => [:test]

desc 'Run all tests'
task :test do
  Rake::Task['classic_test'].invoke
  Rake::Task['modular_test'].invoke
end

desc 'Run the tests in classic app mode'
task :classic_test do
  puts ''
  puts '### Running classic-mode test...'
  puts ''

  ENV['RACK_ENV'] = 'classic'
  Rake::Task['run_tests'].reenable
  Rake::Task['run_tests'].invoke
end

desc 'Run the tests in modular app mode'
task :modular_test do
  puts ''
  puts '### Running modular-mode test...'
  puts ''

  ENV['RACK_ENV'] = 'modular'
  Rake::Task['run_tests'].reenable
  Rake::Task['run_tests'].invoke
end

Rake::TestTask.new(:run_tests) do |t|
  t.test_files = FileList['test/**/*_test.rb']
  t.ruby_opts = ['-rubygems'] if defined? Gem
end
