Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name = 'bourbon'
  s.version = '0.1.0'
  s.date = '2009-04-25'

  s.description = "Liquid support for Sinatra"
  s.summary     = "Liquid support for Sinatra"

  s.authors = ["Jason Wadsworth"]
  s.email = "jdwadsworth@gmail.com"

  # = MANIFEST =
  s.files = %w[
    CHANGES
    LICENSE
    README.rdoc
    TODO
    Rakefile
    lib/sinatra/bourbon.rb
    lib/sinatra/extension.rb
    lib/sinatra/monkey_patch.rb
    bourbon.gemspec
    test/app/classic.rb
    test/app/modular.rb
    test/app/taster.rb
    test/app/views/file.erb
    test/app/views/file.liquid
    test/app/views/layout.erb
    test/app/views/layout.liquid
    test/helper.rb
    test/sinatra/bourbon_test.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select {|path| path =~ /^test\/.*_test.rb/}

  s.extra_rdoc_files = %w[README.rdoc LICENSE]
  s.add_dependency 'sinatra', '>= 0.9.1'

  s.has_rdoc = true
  s.homepage = "http://github.com/subakva/bourbon/tree"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Bourbon", "--main", "README.rdoc"]
  s.require_paths = %w[lib]
  s.rubyforge_project = 'bourbon'
  s.rubygems_version = '1.3.1'
end
