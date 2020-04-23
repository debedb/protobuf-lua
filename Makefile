.PHONY: all rockspec build install-test clean

VERSION = 1.1.2.debedb
NAME = protobuf-$(VERSION)-0

all: build

rockspec:
	sed "s/%VERSION%/$(VERSION)/g" protobuf.rockspec.tmpl > protobuf-$(VERSION)-0.rockspec

build: rockspec
	${LUA_ROCKS} pack protobuf-$(VERSION)-0.rockspec

install: build
	${LUA_ROCKS} install protobuf-1.1.2.debedb-0.src.rock

clean:
	rm -rf *.rockspec *.rock src/pb.o src/pb.so tree
	find . -name "*.pyc" -exec rm -rf {} \;
