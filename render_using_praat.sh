#!/bin/bash

# This script builds Using Praat for Linguistic research on any Unix-based machine with both Pandoc and XeLaTeX and Perl installed.

# Captures the date for later use
date=`date +"%m-%d-%y-%H%M"`

# Move into the build folder
cd build
# Make a copy of the markdown file for processing (safety measure in case of scripting errors)
cp ../usingpraat.md usingpraatbuild.md
cp ../usingpraat.bib bibtex.bib

# Run Pandoc to turn the markdown file with the bulk of the document into a .TeX file
pandoc -f markdown+raw_tex --pdf-engine=xelatex  -i usingpraatbuild.md -o pandocked.tex

# Remove some of the junk that Markdown adds when converting to TeX.
sed -i .bak 's/\\tightlist//g' pandocked.tex
sed -i .bak 's/\[<+->\]//g' pandocked.tex
sed -i .bak 's/\\def\\labelenumi{\\arabic{enumi}.}//g' pandocked.tex
sed -i .bak 's/\\itemsep1pt\\parskip0pt\\parsep0pt//g' pandocked.tex
sed -i .bak 's/-\\textgreater{}/\$\\to\$/g' pandocked.tex

# Prettify F0 writing, and also make fake arrows into real arrows

perl -pi -w -e 's/F0/F\$_{0}\$/g;' pandocked.tex
perl -pi -w -e 's/-\textgreater{}/\$\to\$/g;' pandocked.tex

# Concatenate the header file (with the preambles, TOC, etc), the pandoc-created TeX file, and the footer file (with the bibliography) into a single buildable TeX file
cat header.tex pandocked.tex footer.tex > usingpraat.tex

# Build the TeX once without stopping for errors (as the hyperref plugin throws errors on the first run)
xelatex -output-driver="xdvipdfmx" -interaction=nonstopmode -synctex=1 usingpraat

# Render the bibliography based on the prior file
bibtex usingpraat

# Render the file twice more, to ensure that the bibliographical references are included and that the TOC reflects everything accurately
xelatex -output-driver="xdvipdfmx" -synctex=1 usingpraat
xelatex -output-driver="xdvipdfmx" -synctex=1 usingpraat

# Open the PDF generated 
open usingpraat.pdf

# Delete the TeX files
rm bibtex.bib
rm usingpraatbuild.md
rm usingpraat.aux
rm usingpraat.bbl
rm usingpraat.blg
rm usingpraat.log
rm usingpraat.out
rm usingpraat.synctex.gz
rm usingpraat.thm
rm usingpraat.toc
rm usingpraat.tex
rm pandocked.tex
rm pandocked.tex.bak

# Move the PDF and final TeX out of the build folder for accessibility
mv usingpraat.pdf ../UsingPraatforLinguisticResearchLatest.pdf
