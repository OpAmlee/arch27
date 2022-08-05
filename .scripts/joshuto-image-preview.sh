
#!/usr/bin/env bash

case $(file -b --mime-type "$1") in
	image/*)
		kitty +kitten icat --transfer-mode file --place "$2x$3@$4x$5" "$1"
		;;
esac

exit 0
