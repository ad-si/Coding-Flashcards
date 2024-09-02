# Godot Flashcards

Over TODO flashcards to learn about [Godot] and [GDScript] from first principles.

<img
  alt="Screenshot of Anki showing a Godot flashcard"
  src="screenshots/2024-03-09t1127_anki.png"
  width="50%"
>

<br>

The cards are written in markdown
and based on the official [Godot Documentation].

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
[Godot Documentation]: https://reference.wolfram.com/language/
