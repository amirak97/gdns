#!/usr/bin/env bash

set -euo pipefail

COMMAND="${1:-}"
MODE="${2:-}"
CONNECTION=$(nmcli -t -f NAME connection show --active | head -n1)

if [[ "$COMMAND" != "set" ]]; then
    echo "Usage:"
    echo "  gdns set <dns1> [dns2]"
    echo "  gdns set isp"
    exit 1
fi

if [[ "$MODE" == "isp" ]]; then
    nmcli connection modify "$(nmcli -t -f NAME connection show --active | head -n1)" \
        ipv4.ignore-auto-dns no \
        ipv4.dns ""
else
    DNS_SERVERS=("${@:2}")

    for dns in "${DNS_SERVERS[@]}"; do
        if [[ ! "$dns" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
            echo "Invalid DNS: $dns"
            exit 1
        fi
    done

    nmcli connection modify "$CONNECTION" \
        ipv4.ignore-auto-dns yes \
        ipv4.dns "${DNS_SERVERS[*]}"
fi

nmcli connection up "$CONNECTION"
