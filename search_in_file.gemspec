# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'search_in_file/version'

Gem::Specification.new do |spec|
  spec.name          = "search_in_file"
  spec.version       = SearchInFile::VERSION
  spec.authors       = ["bmalets"]
  spec.email         = ["b.malets@gmail.com"]
  spec.summary       = %q{Search files with phrase by directory path}
  spec.description   = %q{Search word or phrase in .pdf,.txt,.doc and .docx files by directory path}
  spec.homepage      = "https://github.com/bmalets/search_in_file/blob/master/README.md"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pdf-reader", "~> 1.3.3"
  spec.add_development_dependency "docx", "~> 0.2.03"
  spec.add_development_dependency "rspec"
end
