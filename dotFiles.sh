#!/bin/sh

# Copyright (C) 2008 Daniel Schierbeck
#
# Synchronize the configuration files in your Dropbox with your local user
# account.
#
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#

# The path to the Dropbox folder containing your dot-files.
CONFIGURATION_DIR=~/Dropbox/Settings

files=`ls -AB1 $CONFIGURATION_DIR`

force=0

while :
do
  case $1 in
    -f|--force)
      force=1
      ;;
    *)
      break
      ;;
  esac
  shift
done

cd ~

for file in $files
do
  if [ -h $file ]
  then
    # There's already a symlink with that name -- we'll replace it.
    rm $file
    echo "Replaced symlink ${file}"
  elif [ -d $file -o -f $file ]
  then 
    # There's already a file/directory with that name -- we'll skip it unless
    # --force is set.
    if [ $force -eq 1 ]
    then
      rm -fr $file
      echo "Replaced ${file}"
    else
      echo "Skipped ${file}, there's already a file/directory with that name"
      continue
    fi
  elif [ ! -e $file ]
  then
    # File doesn't exist -- no problem.
    echo "Added ${file}"
  else
    echo "Skipped ${file}, it ain't a symlink, file or directory..."
  fi

  ln -s $CONFIGURATION_DIR/$file .
done
