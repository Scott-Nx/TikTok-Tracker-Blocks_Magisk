# TikTok Tracker Blocks Magisk Module

A simple Magisk module to block TikTok tracking domains on Android devices.

## Description

This module adds entries to your device's hosts file to block numerous TikTok tracking domains. It prevents TikTok from collecting your activity data and fingerprinting your device while still allowing the app to function for normal use.

## Features

- Blocks 300+ TikTok tracking and fingerprinting domains
- Simple installation via Magisk Manager

## Requirements

- Android device with [Magisk](https://github.com/topjohnwu/Magisk) installed
- Magisk Manager app

## Installation

1. Download the latest module ZIP from the [Releases](https://github.com/scxtt-nc/TikTok-Tracker-Blocks_Magisk/releases) page
2. Open Magisk Manager
3. Tap on Modules > Install from storage
4. Select the downloaded ZIP file
5. Reboot your device

## How It Works

The module modifies the system's hosts file to redirect tracking domain requests to `0.0.0.0`, effectively blocking the connection. This prevents TikTok from sending your usage data to their tracking servers.

## Credits

- Host list maintained by [hagezi](https://github.com/hagezi/dns-blocklists)
- Module maintained by [scxtt-nc](https://github.com/scxtt-nc)

## Disclaimer

This module is provided as-is with no warranties. While it aims to block tracking domains, it may not block all tracking activities, and new tracking methods may be implemented by TikTok in the future. The module may cause unexpected behavior in the TikTok app.

## Updates

The blocklist is regularly updated to include the latest known tracking domains. To receive updates, check back periodically or watch this repository.