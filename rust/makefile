.PHONY: help
help: makefile
	@tail -n +4 makefile | grep ".PHONY"


cards.apkg: cards.md
	anki-panky $<


cards-with-name.md: cards.md
	deck_name=$$(awk '/^name:/{sub(/^name: */,""); print; exit}' $<); \
	awk -v name="$$deck_name" 'BEGIN{y=0} /^-{3,}$$/ {print; if(y<2){y++; next} print ""; print "*" name "*"; next} {print}' $< > $@


cards-with-name.apkg: cards-with-name.md
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
build: cards.apkg cards-with-name.apkg cards.pdf


.PHONY: test
test: cards.apkg
	nix flake check
	unzip cards.apkg -d cards-test
	ls -l cards-test


.PHONY: clean
clean:
	rm -f cards.apkg cards.pdf cards-with-name.md cards-with-name.apkg
	rm -rf cards-test
