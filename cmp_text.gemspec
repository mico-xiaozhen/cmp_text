# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cmp_text/version"

Gem::Specification.new do |spec|
  spec.name          = "cmp_text"
  spec.version       = CmpText::VERSION
  spec.authors       = ["zhouxiaozhen"]
  spec.email         = ["mico_xiaozhen@sina.com"]

  spec.summary       = '比较两个文件中文字相似度,也可以直接比较2段文字'
  spec.description   = '比较两个文件中文字相似度,也可以直接比较2段文字'
  spec.homepage      = "https://github.com/mico-xiaozhen/cmp_text"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
