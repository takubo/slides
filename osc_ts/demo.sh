#!/bin/sh
awk -f ball_new.awk &
sleep 1
awk -f earth_light.awk &
sleep 1
awk -f planets.awk sol_system.txt &
sleep 1
awk -f trackball_dev.awk &
sleep 1
awk -f webcam.awk &
