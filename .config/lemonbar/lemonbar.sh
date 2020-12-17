#!/bin/bash

killall -q lemonbar

~/.config/lemonbar/lemon.sh | lemonbar -p -g 1920x22+0+25 -F "FFFFFFFF" -B "FF222222" -U "268BD2" -u 3 -o +0 -f "JetBrains Mono Medium"-12 -o -2 -f "Hack Nerd Font"-16 | $SHELL
