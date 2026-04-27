.PHONY: help
help: makefile
	@tail -n +4 makefile | grep ".PHONY"


.PHONY: build
build:
	cd rust && make build
	cd godot && make build
	cd sqlite && make build
	cd wolfram-language && make build


.PHONY: test
test:
	cd rust && make test
	cd godot && make test
	cd sqlite && make test
	cd wolfram-language && make test


.PHONY: clean
clean:
	cd rust && make clean
	cd godot && make clean
	cd sqlite && make clean
	cd wolfram-language && make clean
