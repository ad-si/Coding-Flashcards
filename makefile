.PHONY: help
help: makefile
	@tail -n +4 makefile | grep ".PHONY"


.PHONY: build
build:
	cd rust && make build
	cd godot && make build
	cd sqlite && make build
	cd wolfram-language && make build


cards-combined.md: rust/cards.md godot/cards.md sqlite/cards.md wolfram-language/cards.md
	printf -- '---\nname: Coding Flashcards\n---\n' > $@
	for f in $^; do \
		dir=$$(dirname "$$f"); \
		awk -v dir="$$dir" 'BEGIN{seen=0} \
			/^---$$/ && seen<2 {seen++; next} \
			seen>=2 {gsub(/\.\/images\//, "images/"); gsub(/images\//, dir "/images/"); print}' \
			"$$f" >> $@; \
	done


cards-combined.apkg: cards-combined.md
	anki-panky $<


cards-combined.pdf: cards-combined.md
	pandoc \
		--pdf-engine tectonic \
		--variable "geometry:papersize={130mm,130mm}" \
		--variable "fontsize: 10pt" \
		--variable "monofont:Hasklug Nerd Font Mono" \
		--variable "monofontoptions:Scale=0.7, FontFace={weight=700}" \
		--to beamer \
		--output $@ \
		$<


.PHONY: build-combined
build-combined: cards-combined.apkg cards-combined.pdf


.PHONY: test
test:
	cd rust && make test
	cd godot && make test
	cd sqlite && make test
	cd wolfram-language && make test


.PHONY: clean
clean:
	rm -f cards-combined.md cards-combined.apkg cards-combined.pdf
	cd rust && make clean
	cd godot && make clean
	cd sqlite && make clean
	cd wolfram-language && make clean
