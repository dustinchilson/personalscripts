#!/bin/sh

rails new $1 #Creates the Rails Project

cd $1 #Changes to the Rails Project Directory

git init #Initializes the git repository
  
#Creates a git ignore file in the Project root directory to hide your log files 
#and other development files
cat <<EOF > .gitignore
.DS_Store
log/*.log
tmp/**/*
db/*.sqlite3
coverage
doc/app/*
EOF

#Creates git ignore files in empty directories to make them show in the repo
find . -type d -empty -exec touch {}/.gitignore \;

#Creates the .gems file for heroku
touch .gems

#Adds all of the folders and files to the staging area for git
git add .

#Commits the changes to the repository
git commit -a -m "Initial import."

#Opens your project in Textmate
cd ..
mate $1