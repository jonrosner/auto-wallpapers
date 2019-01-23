#!/bin/bash
basename="$(dirname $0)"
python3 $basename/wallpapers.py > $basename/logs.txt 2>&1
