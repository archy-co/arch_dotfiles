#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# polybar -rq dummy & 

# polybar -rq music &
polybar -rq notifications &
sleep 1
polybar -rq tray &
polybar -rq options &
polybar -rq i3 &
polybar -rq music &


echo "Polybar launched..."
