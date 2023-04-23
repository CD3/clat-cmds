DEST="${HOME}/bin"
if [ -d "$DEST" ]
then
  install src/* "$DEST"
else
  echo "$DEST directory does not exists. Cannot install."
fi
