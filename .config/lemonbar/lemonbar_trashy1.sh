#!/bin/bash

killall lemonbar

bash | lemonbar -p -g x28 -F#00000000 -B#00000000 | 

bash /home/archy/.config/i3/lemonbar/lemon.sh | lemonbar -d 0 -g 1920x22+0+0 -p -F#FFFFFFFF -B#00000000 -o -f "Roboto Small" -f 'Font Awesome 5 Free' -f 'Font Awesome 5 Brands' -f 'Font Awesome 5 Free Solid' -f "Roboto Medium"
