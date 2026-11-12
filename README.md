# gdns

A simple Bash utility to quickly manage DNS settings on Linux using NetworkManager (`nmcli`).

## Features

- Set custom DNS servers.
- Set XODNS Sanctions-breaker ips easily
- Restore automatic DNS configuration provided by your ISP (DHCP).
- Support multiple DNS servers.
- Lightweight, dependency-minimal Bash script.

## Requirements

- Linux
- Bash
- NetworkManager
- `nmcli`

## Installation

Clone the repository:

```bash
git clone https://github.com/USERNAME/gdns.git
cd gdns
```

Install the script:

```bash
sudo install -m 755 gdns /usr/local/bin/gdns
```

## Usage

### Set custom DNS

```bash
gdns set 1.1.1.1 8.8.8.8
```

You can provide one or multiple DNS servers:

```bash
gdns set 8.8.4.4
gdns set 1.1.1.1 1.0.0.1
```
### Set sanctions breaker
```bash
gdns set gdns
```
This instrucions sets `xodns` ips automaticly on your linux system.

### Restore ISP DNS

```bash
gdns set isp
```

This restores automatic DNS configuration through DHCP.

## Examples

| Command | Description |
|---|---|
| `gdns set 1.1.1.1` | Set Cloudflare DNS |
| `gdns set 8.8.8.8 8.8.4.4` | Set Google DNS |
| `gdns set isp` | Restore automatic ISP DNS |

## How It Works

`gdns` uses NetworkManager's command-line interface (`nmcli`) to modify the DNS configuration of the active network connection.

- Custom DNS: disables automatic DNS and applies the specified servers.
- ISP DNS: re-enables automatic DNS and clears manually configured DNS servers.

## Limitations

- Currently supports IPv4 DNS servers.
- Requires NetworkManager.
- Modifies the active connection profile.

## License

MIT License

