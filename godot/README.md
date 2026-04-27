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


## Related

- [Every 2D Node Explained in 9 Minutes](https://www.youtube.com/watch?v=22VYNOtrcgM)
- [GD Script Flashcards](https://www.brainscape.com/flashcards/gd-script-10447882/packs/18717811)
- [Learn GDScript From Zero](https://gdquest.github.io/learn-gdscript/)
- [The 60 Most Useful Godot 4.2 Nodes](https://www.youtube.com/watch?v=caLxyBIvHzE) (incl. PDF)
- [You're missing out if you don't use these in Godot 4](https://www.youtube.com/watch?v=7gnozJ7KPK4)
