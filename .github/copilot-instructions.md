# Copilot instructions for TikTok-Tracker-Blocks_Magisk

Goal: Enable AI agents to maintain this Magisk module safely and consistently with existing patterns.

## Big picture
- Magisk module that overlays `/system/etc/hosts` with a TikTok tracking/fingerprinting blocklist.
- Standard Magisk ZIP layout:
  - `module/module.prop` (metadata), `module/system/etc/hosts` (payload), legacy installers in `module/META-INF/...`.
  - Repo root: `README.md`, `LICENSE`, `COPYING.GPLv3`, `changelog.md`, `update.json`, optional `install.zip`.
- `module.prop` and `update.json` must stay in sync for Magisk OTA updates.

## Conventions you must follow
- Versioning:
  - `version`: `vYYYY.MM.DD-rN` (e.g., v2025.07.25-r1)
  - `versionCode`: `YYYYMMDDRNN` (e.g., 202507251) — strictly increasing.
  - Any `hosts` change → bump both fields in module.prop and update.json.
- Licensing/sources:
  - Hosts from `hagezi/dns-blocklists`; keep header/provenance in `hosts`.
  - Repo is MIT; bundled hosts/scripts may be GPLv3 — retain `COPYING.GPLv3` and credits.
- Packaging:
  - Keep exact folder paths; do not add extra nesting or build steps. Release is a ZIP of `module/`.
  - Do not change `id` in `module/module.prop` once published.

## Maintenance workflow
1) Update `module/system/etc/hosts` from upstream (compressed hosts syntax: `0.0.0.0` then 9 domains per line typical; keep header).
2) Bump `version` and `versionCode` in `module/module.prop`.
3) Mirror the same values in `update.json`; ensure `zipUrl` (points to release/`install.zip`) and `changelog` URLs are valid.
4) Add an entry to `changelog.md` for the date/rN.
5) Package a ZIP of `module/` and publish where `update.json.zipUrl` references.

## File cues (examples)
- `module/module.prop`
  - id=TikTokTB; name=TikTok Trackers Blocker; version=v2025.07.25-r1; versionCode=202507251
  - updateJson=https://raw.githubusercontent.com/Scott-Nx/TikTok-Tracker-Blocks_Magisk/main/update.json
- `update.json` keys: { version, versionCode, zipUrl, changelog } — keep values aligned with module.prop.

## PR expectations
- Small, focused diffs; preserve line endings and file headers.
- Edits to `hosts` must include synchronized version bumps in both files and a changelog note.
- Changes under `META-INF` require rationale and on-device validation.

## Gotchas
- Desync between module.prop and update.json breaks Magisk Manager updates.
- Wrong path under `module/` causes install failure.
- Aggressive list can impact TikTok features (as documented in README).
