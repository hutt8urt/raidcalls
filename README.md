```md
# HENM Timer

HENM Timer is an Ashita v4 addon that provides a compact ImGui interface for managing repeating encounter timers.
The addon allows players to quickly start and stop repeating add timers through a simple UI instead of manually tracking countdowns during combat.
Designed primarily for HNMs and endgame encounters with repeating mechanics, HENM Timer helps improve raid coordination and awareness.

# Features
- Compact ImGui UI
- Adjustable repeating timer
- Customizable add/message label
- Automatic countdown announcements
- Real-time countdown display
- Simple start/stop controls
- Lightweight encounter timer utility

# Installation
Place the addon folder inside: Ashita/addons/
Load the addon in-game: /addon load henm_timer

# Usage

## Timer Length
Set the timer length in seconds.

Example:
"47"

> Creates a repeating 47 second timer.

## Message
Set the message label used for countdown announcements.

Examples:
* ADDS
* CRAB
* PHASE
* SPAWN

## Start Timer
Starts the repeating encounter timer.

## Stop Timer
Stops the repeating encounter timer.

# Countdown Warnings
The addon automatically announces:
* 10 seconds
* 3 seconds
* 2 seconds
* NOW

# Example Output
* ADDS IN 10s
* ADDS IN 3s
* ADDS IN 2s
* ADDS NOW!

# Notes
HENM Timer does not automate gameplay in any way.

The addon only:
* tracks local timers
* displays UI information
* sends chat countdown messages

No combat automation, targeting, movement, packet interaction, or unattended gameplay functionality is included.

# Author
Toogood @ Horizon
```
