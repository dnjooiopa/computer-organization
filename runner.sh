#!/bin/bash
rm *.o
rm "$1"
as -o "$1".o "$1".s
gcc -o "$1" "$1".o
