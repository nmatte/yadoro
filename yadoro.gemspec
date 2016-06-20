# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yadoro/version'

Gem::Specification.new do |spec|
  spec.name          = "yadoro"
  spec.version       = Yadoro::VERSION
  spec.authors       = ["Nathan Matteson"]
  spec.email         = ["nwmatteson@gmail.com"]

  spec.summary       = %q{Yet another pomodoro.}
  spec.description   = %q{Yet another pomodoro CLI, complete with desktop notifications.}
  spec.homepage      = "http://github.com/nmatte"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'byebug', '~> 9.0', '>= 9.0.5'
  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "terminal-notifier", "1.6"
  spec.add_dependency "ruby-progressbar", "~> 1.8", ">= 1.8.1"
end
