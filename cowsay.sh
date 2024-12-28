#!/usr/bin/env sh

set -eu

editorCmd="${EDITOR:-vi}"
cowsDir="/usr/share/cowsay/cows"
defaultMessage='Good afternoon,\n\nsomething and other and a warning.\n\nThank you for understanding!'
previewMessage="${*:-$defaultMessage}"

if [ ! -d "$cowsDir" ]; then
  cowsDir="/usr/share/cows"
fi

cowFile="$(find "$cowsDir" -type f -name '*.cow' | fzf +m --height 60% \
	--preview "echo -e '$previewMessage' | cowsay -f {}")"

if [ -z "$cowFile" ]; then
  exit 0
fi


cowsay -f "$cowFile" "$@"