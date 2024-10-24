run:
	ruby ./advent/2023/main.rb

spec: 
	bundle exec rspec ./advent/2023/* --format documentation

cop:
	bundle exec rubocop -A