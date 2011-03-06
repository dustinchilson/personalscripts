#!/bin/sh
echo Spell Checking!
aspell check $1.tex
echo Creating Document!
pdflatex -interaction=batchmode -no-shell-escape $1.tex > /dev/null
echo Adding Bibliography!
bibtex -terse $1.aux > $1bib.log
pdflatex -interaction=batchmode -no-shell-escape $1.tex > /dev/null
pdflatex -interaction=batchmode -no-shell-escape $1.tex > /dev/null
rm $1.fff $1.ttt $1.aux $1.bbl $1.blg $1.log $1bib.log

/usr/bin/osascript \
  -e "set theFile to POSIX file \"${1}.pdf\" as alias" \
  -e "set thePath to POSIX path of theFile" \
  -e "tell application \"Skim\"" \
  -e "  activate" \
  -e "  set theDocs to get documents whose path is thePath" \
  -e "  try" \
  -e "    if (count of theDocs) > 0 then revert theDocs" \
  -e "  end try" \
  -e "  open theFile" \
  -e "end tell"

echo Done!
