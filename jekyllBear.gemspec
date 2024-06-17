# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-bear-theme"
  spec.version       = "0.1.6"
  spec.authors       = ["knhash"]
  spec.email         = ["mail@knhash.in"]

  spec.summary       = "A minimal, text focused blog theme inspired by Bear Blog"
  spec.homepage      = "https://knhash.in/jekyllBear"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3.3"
  spec.add_runtime_dependency "webrick", "~> 1.8.1"
  spec.add_runtime_dependency "jekyll-redirect-from", "~> 0.16.0"
end
