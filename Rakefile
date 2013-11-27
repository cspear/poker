require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :run do
  ruby "runner.rb"
end

task :test     => :spec
task :default  => :spec