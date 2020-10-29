# frozen_string_literal: true

ruby '~> 2.3.7'

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :test do
  gem "rspec", "~> 3.9"
end

group :test, :development do
  gem "guard-rspec", "~> 4.7"
end
