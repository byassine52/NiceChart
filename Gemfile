# frozen_string_literal: true

source 'https://rubygems.org'

# Main gems
gem 'fastlane'

# Development gems
group :development do
	gem 'danger'
	gem 'reek'
	gem 'rubocop'
end

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
