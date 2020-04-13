source 'https://rubygems.org'
ruby '2.6.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'jekyll', '~> 3.7.4'
gem 'jekyll-redirect-from', '~> 0.13.0'
gem 'jekyll-sitemap', '~> 1.1.1'
gem 'jekyll-toc', '~> 0.5.1'
gem 'rack-jekyll', github: 'adaoraul/rack-jekyll'

# Host on Heroku with thin
gem 'thin'

group :development, :test do
  gem 'rubocop'
end
