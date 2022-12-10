run:
	ruby ./main.rb

spec: 
	bundle exec rspec ./advent/* --format documentation

cop:
	bundle exec rubocop -A