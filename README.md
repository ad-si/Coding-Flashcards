# Wolfram Flashcards

Over TODO flashcards to learn the [Wolfram Language] from first principles.

<img
  alt="Screenshot of Anki showing a Wolfram Language flashcard"
  src="screenshots/2024-03-09t1127_anki.png"
  width="50%"
>

<br>

The cards are written in markdown
and based on the official [Wolfram Language Documentation].

Either get the [Anki] deck directly from
[AnkiWeb - Wolfram Language Flashcards](https://ankiweb.net/shared/info/1541471942)
or download the latest version from the
[releases page](https://github.com/ad-si/Wolfram-Language-Flashcards/releases).


## Development

Run `nix develop` to enter the development environment
with [Anki Panky] and [Pandoc] installed.

Then run following [makefile](./makefile) targets to build the artifacts:

- `make cards.apkg` to generate the [Anki] deck
- `make cards.pdf` to generate the PDF file


[Anki Panky]: https://github.com/kamalsacranie/anki-panky
[Anki]: https://apps.ankiweb.net
[Pandoc]: https://pandoc.org
[Wolfram Language]: https://www.wolfram.com/language/
[Wolfram Language Documentation]: https://reference.wolfram.com/language/
