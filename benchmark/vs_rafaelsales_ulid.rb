require 'benchmark_driver'

# Benchmark.driver do |x|
#   x.prelude <<~RUBY
#     require 'bundler/inline'

#     gemfile do
#       source 'https://rubygems.org'
#       gem 'ulid', require: false
#       gem 'ruby-ulid', require: false, path: '../'
#     end

#     require 'ulid'
    
#     AnotherULID = ULID
#     Object.__send__ :remove_const, :ULID

#     require 'ruby-ulid'

#     MyULID = ULID
#     Object.__send__ :remove_const, :ULID
#     ULID = AnotherULID

#     raise 'Aliasing ULID is falied' unless ULID.generate.instance_of?(ULID)
#     raise 'Loading AnotherULID is falied' unless AnotherULID.generate.instance_of?(String)
#   RUBY

#   x.report 'kachick / ULID.generate.to_s', %{ ULID.generate.to_s }
#   x.report 'rafaelsales / ULID.generate', %{ AnotherULID.generate }
# end


Benchmark.driver do |x|
  x.prelude <<~RUBY
    require 'bundler/inline'

    gemfile do
      # source 'https://rubygems.org'
      gem 'ruby-ulid', require: false, path: '../'
    end

    require 'ulid'

    raise 'Loading expected ULID library is falied' unless ULID.generate.instance_of?(ULID)
  RUBY

  x.report 'kachick / ULID.generate.to_s', %{ ULID.generate.to_s }
  x.report 'test', %{ ULID.generate.to_i }
end

# Benchmark.driver do |x|
#   x.prelude <<~RUBY
#     require 'bundler/inline'

#     gemfile do
#       source 'https://rubygems.org'
#       gem 'ulid', require: false
#     end

#     require 'ulid'

#     raise 'Loading expected ULID library is falied' unless ULID.generate.instance_of?(String)
#   RUBY

#   x.report 'rafaelsales / ULID.generate', %{ ULID.generate }
# end