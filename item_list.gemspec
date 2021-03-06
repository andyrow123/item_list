# coding: utf-8

lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'item_list/version'

Gem::Specification.new do |spec|
  spec.name          = 'item_list'
  spec.version       = ItemList::VERSION
  spec.authors       = ['Austin Rowsell']
  spec.email         = ['andyrow123@hotmail.co.uk']

  spec.summary       = 'Create an item list form an array of objects'
  spec.description   = 'Create an item list form an array of objects'
  spec.homepage      = 'https://github.com/andyrow123/item_list'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.48.1'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.14.1'
  spec.add_development_dependency 'simplecov-console', '~> 0.4.1'
end
