#! /usr/bin/env bash

find demos -type f -name dub.json -print | while read i
do
    echo -n "TEST: $i " &&
    (
        i="$(dirname "$i")" &&
        cd "$i" &&
        if [ "$i" = 'demos/gtk' ]
        then
            dub build :hello_world &&
            dub build :other_tests &&
            dub build :popup_menu &&
            dub build :spawn_tests
        else
            dub build
        fi
    ) 2> /dev/null > /dev/null &&
    echo '✓' || echo '✖'
done