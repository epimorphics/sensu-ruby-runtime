NAME?=sensu-ruby-runtime
VERSION?=local-build
RUBY_VERSION?=3.1.2
ARCH=amd64
OS=linux
PLATFORM=rhel
ROOT=${NAME}_${VERSION}_ruby-${RUBY_VERSION}
SHA=dist/${ROOT}_sha512-checksums.txt

all: clean sha

clean:
	@rm -rf dist

dir:
	@mkdir -p dist

almalinux9.3 alpine amzn2 debian: dir
	@docker build --build-arg "RUBY_VERSION=${RUBY_VERSION}" -t ${ROOT}_$@:${VERSION} -f Dockerfile.$@ .
	@docker run --rm -v "`pwd`/dist:/dist" ${ROOT}_$@:${VERSION} cp /assets/${NAME}_local_build_ruby-${RUBY_VERSION}_$@_linux_amd64.tar.gz /dist/${ROOT}_$@_linux_amd64.tar.gz

assets: almalinux9.3 alpine amzn2 debian

sha: ${SHA}

${SHA}: assets 
	@sha512sum dist/*.tar.gz > $@
