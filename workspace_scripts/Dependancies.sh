#!/bin/env bash
set -eo pipefail

sudo apt update

if ! command -v wmctrl > /dev/null; then
    sudo apt install -y wmctrl
fi

if ! command -v xdotool > /dev/null; then
    sudo apt install -y xdotool
fi
