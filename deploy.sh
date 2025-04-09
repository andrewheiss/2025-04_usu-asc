#!/usr/bin/env sh

REMOTE_HOST="ath-cloud"
REMOTE_DIR="~/sites/talks.andrewheiss.com/public_html/2025-04_usu-asc"
REMOTE_DEST=$REMOTE_HOST:$REMOTE_DIR

echo "Uploading new changes to remote server..."
echo
rsync -crvP --exclude '*_cache' --delete _site/ $REMOTE_DEST

if [ $? -eq 0 ]; then
  echo
  echo "... done!"
  echo
  echo "The site is live at https://talks.andrewheiss.com/2025-04_usu-asc/"
else
  echo
  echo "Error!"
  exit 1
fi
