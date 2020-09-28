
dependencies:
	sudo apt-get install ruby ruby-dev build-essential zlib1g-dev
	sudo chown -R ${USER}:${USER} /var/lib/gems/
	sudo chown -R ${USER}:${USER} /usr/local/bin/

mac-dependencies:
	brew install ruby
	sudo gem install bundler:2.1.4

run:
	bundle install
	bundle exec jekyll serve
