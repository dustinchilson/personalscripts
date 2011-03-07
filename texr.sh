#!/bin/sh
aspell check $1.tex
latex -interaction=batchmode -no-shell-escape $1.tex
dvips -Ppdf -q -t letter $1.dvi
ps2pdf $1.ps
rm $1.aux $1.dvi $1.ps 
rm $1.log

echo $1 Done!
