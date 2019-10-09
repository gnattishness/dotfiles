#!/bin/bash
# A simple black screen locker

# TODO dim screen?
# lock the screen
i3lock -c 000000

# sleep 1 adds a small delay to prevent possible race conditions with suspend
sleep 1

exit 0
