~/Scripts/texr.sh coverletter
~/Scripts/texr.sh resume

gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=DChilson_Resume.pdf coverletter.pdf resume.pdf

rm resume.pdf coverletter.pdf

/usr/bin/osascript \
  -e "set theFile to POSIX file \"DChilson_Resume.pdf\" as alias" \
  -e "set thePath to POSIX path of theFile" \
  -e "tell application \"Skim\"" \
  -e "  activate" \
  -e "  set theDocs to get documents whose path is thePath" \
  -e "  try" \
  -e "    if (count of theDocs) > 0 then revert theDocs" \
  -e "  end try" \
  -e "  open theFile" \
  -e "end tell"


