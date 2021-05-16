# frozen_string_literal: true

require_relative "lib/omniauth/sh4/version"

Gem::Specification.new do |spec|
  spec.add_dependency "oauth2",     "~> 1.4"
  spec.add_dependency "omniauth",   [">= 1.9", "< 3"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.authors       = ["dn2000"]
  spec.email         = ["unitdesign2014@gmail.com"]
  spec.description   = "An abstract OAuth2 strategy for OmniAuth."
  spec.summary       = "An abstract OAuth2 strategy for OmniAuth."
  spec.homepage      = "https://github.com/dn2000/sh4_oauth"
  spec.license       = "MIT"

  spec.name          = "omniauth-sh4"
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.version       = Omniauth::Sh4::VERSION
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
