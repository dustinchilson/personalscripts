#!/bin/sh

rails $1

cd $1

git init

cat <<EOF > .gitignore
.DS_Store
log/*.log
tmp/**/*
db/*.sqlite3
coverage
doc/app/*
EOF

find . -type d -empty -exec touch {}/.gitignore \;

git add .
git commit -a -m "Initial import of project."

mate $1