#!/bin/bash

if nmcli -t -f WIFI g | grep -q "enabled"; then
    if nmcli -t -f active,ssid dev wifi | grep -q '^yes'; then
        echo ""
    else
        echo ""
    fi
else
    echo ""
fi
