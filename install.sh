DEST="${HOME}/bin"
if [ -d "$DEST" ]
then
  cp src/* "$DEST"
else
  echo "$DEST directory does not exists. Cannot install."
fi
