#!/bin/sh

mkdir ~/.aria2
cp aria2.conf ~/.aria2/aria2.conf
touch ~/.aria2/aria2.session

cp io.github.aria2.plist ~/Library/LaunchAgents/io.github.aria2.plist
cd ~/Library/LaunchAgents/
chmod 644 io.github.aria2.plist
launchctl load io.github.aria2.plist
launchctl start io.github.aria2

aria2c

