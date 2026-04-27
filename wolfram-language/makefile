.PHONY: help
help: makefile
	@tail -n +4 makefile | grep ".PHONY"


cards.apkg: cards.md
	anki-panky $<


cards.pdf: cards.md
	pandoc \
		--pdf-engine tectonic \
		--variable "geometry:papersize={130mm,130mm}" \
		--variable "fontsize: 10pt" \
		--variable "monofont:Hasklug Nerd Font Mono" \
		--variable "monofontoptions:Scale=0.7, FontFace={weight=700}" \
		--to beamer \
		--output $@ \
		$<


.PHONY: build
build: cards.apkg


.PHONY: test
test: cards.apkg
	unzip cards.apkg -d cards-test
	ls -l cards-test


.PHONY: clean
clean:
	rm -f cards.apkg cards.pdf
	rm -rf cards-test
