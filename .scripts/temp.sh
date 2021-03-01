#!/usr/bin/bash

while true; do
	core1="$(sensors)"
	core1=${core1//"Adapter: ISA adapter"}
	core1=${core1/coretemp-isa-0000}
	core1=${core1//'(high = +100.0°C, crit = +100.0°C)'}
	clear
	echo "$core1"
	sleep 2
done
