lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "meditations/version"

Gem::Specification.new do |spec|
  spec.name          = "meditations"
  spec.version       = Meditations::VERSION
  spec.authors       = ["Kirill Shirinkin"]
  spec.email         = ["kirill@mkdev.me"]

  spec.homepage      = "https://mkdev.me"
  spec.license       = "MIT"
  spec.summary       = "Packaged 'Meditations on programming' book"


  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
end
