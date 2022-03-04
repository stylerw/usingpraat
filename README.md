# Using Praat for Linguistic Research

This is the official Github page for the Open Educational Resource 'Using Praat for Linguistic Research', written by Will Styler.

## About the document

For more details on the resource, as well as some accompanying materials, go to <https://savethevowels.org/praat>.

## The format of the document source

This is a hybrid XeLaTeX/Markdown document, with the main document being `usingpraat.md`.  The bulk of the text is written in [Markdown](https://en.wikipedia.org/wiki/Markdown), but complex formatting, tables, and references are rendered in LaTeX.  This is possible using [pandoc](https://pandoc.org/). In general, your contribution text should use Markdown, and rely on TeX only for citations, figures, and references.

All figures are in the 'build' folder, and all bibliographic information is in 'usingpraat.bib'.

## Rendering the Document

To render this document from the source, clone this repository, make sure you have (minimally) XeLaTeX, Bibtex, pandoc and perl around, and then run `bash render_using_praat.sh` on your local machine.  This assumes you have a working Unix environment, which you really should :)

After some chugging, it will render the latest document.

## How to contribute

If you find a typo, formatting issue, or other problem in the document, please feel free to submit a pull request which makes the change, following the formatting guidelines above.

If you'd like to make a more substantial contribution, please feel free to revise both the `usingpraat.md`, `usingpraat.bib`, and to add any additional figures to `build`. Any text and figures should feature only your own work (or properly cited quotes of others' work), and by contributing, you assert that your contributions will fall under the document's Creative Commons license.

I'm still revising the document's text to reflect a multi-author collaborative environment, but you will be duly credited for your work.

Finally, although pull requests are welcome, I reserve the right to modify, revise, or reject any requests for any reasons I see fit.


