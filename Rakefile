require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/presentator'
  t.test_files = FileList['test/lib/presentator/*_test.rb']
  t.verbose = true
end

task :default => :test
