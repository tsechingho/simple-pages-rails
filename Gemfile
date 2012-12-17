source 'http://rubygems.org'

# Declare your gem's dependencies in simple_pages.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

# gems used by the dummy application
gem 'sass-rails', '~> 3.2.3'
gem 'coffee-rails', '~> 3.2.1'

gem 'devise'
gem 'cancan'
gem 'simple_form'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails'

group :test do
  if RUBY_PLATFORM =~ /darwin/i
    gem 'rb-fsevent', '~> 0.9.1'
    gem 'growl'
  end

  if RUBY_PLATFORM =~ /linux/i
    gem 'rb-inotify'
    gem 'libnotify'
  end
end
