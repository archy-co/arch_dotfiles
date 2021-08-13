#!/usr/bin/bash

OUTPUT=$(pidof wpa-cute)

if [[ $? == 0 ]]
then
    sudo killall wpa-cute
fi

sudo wpa-cute

