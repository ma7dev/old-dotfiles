# Jekyll
st() {
	bundle exec jekyll serve;
}
sta() {
    bundle exec jekyll serve --livereload;
}
stphp() {
	port="8080";
	if [ "$#" -ne 0 ]; then
		port="808$1";
	fi
	php -S 127.0.0.1:$port;
}
