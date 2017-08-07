test:
	./node_modules/.bin/nightwatch

test-headfull:
	./node_modules/.bin/nightwatch --env headfull

build: css-build jekyll-build

css-build:
	./node_modules/.bin/pancake
	./node_modules/.bin/node-sass src/sass/main.scss assets/css/style.min.css --output-style compressed

jekyll-build:
	bundle install
	bundle exec jekyll build

run: css-build
	bundle exec jekyll serve -w --incremental
	onchange 'src/sass/*.scss' -- make build

serve: css-build
	echo 'Starting Jekyll'
	bundle exec jekyll serve

stop:
	echo 'Stopping Jekyll'
	pkill -f jekyll

deploy:
	./bin/cideploy.sh
