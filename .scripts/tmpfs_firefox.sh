#!/bin/bash

# Change this to match your correct profile
PROFILE="olgr58f7.trg-arch"

cd "${HOME}/.mozilla/firefox"

if test -z "$(mount | grep -F "${HOME}/.mozilla/firefox/${PROFILE}" )"
then
    mount "${HOME}/.mozilla/firefox/${PROFILE}"
fi

if test -f "${PROFILE}/.unpacked"
then
    rsync -av --delete --exclude .unpacked ./"$PROFILE"/ ./profile/
else
    rsync -av ./profile/ ./"$PROFILE"/
    touch "${PROFILE}/.unpacked"
fi

exit
