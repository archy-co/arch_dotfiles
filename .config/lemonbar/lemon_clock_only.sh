#!/bin/bash

trap 'Update' 5
echo -e "\uf242 %{l}%{B#691DC1}"
background="#9027ce53"

clock() {
    date '+%Y-%m-%d %H:%M:%S'
}

Update() {
    echo -e "%{l}%{+u}%{B$background}Workspaces%{-u} %{r} $(clock)"
}

while :; do
  Update
  sleep 0.5 &
  wait
done
