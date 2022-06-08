#!/bin/sh
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=:0 -h elitebook -v $HOME/.Xauthority:/home/kof/.Xauthority gui
