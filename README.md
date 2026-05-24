```md id="mq7zpl"
# RaidCalls

RaidCalls is an Ashita v4 addon that provides a compact ImGui interface for raid communication.
The addon allows players to quickly send standardized raid instructions through clickable buttons instead of manually typing callouts during combat.
Originally designed as an accessibility-focused tool, RaidCalls helps improve communication during HNMs, Dynamis, and other endgame events.

# Features
- Compact ImGui UI
- One-click raid callouts
- Multiple chat output modes
- Party + Tell support
- Dynamis utility reminders
- Hold percentage reminders
- Stun coordination buttons
- Accessibility-friendly communication

# Installation
Place the addon folder inside: Ashita/addons/
Load the addon in-game: /addon load raidcalls

# Commands

## Party Chat
"/rcmode p"

> Sets RaidCalls to Party chat mode.

## Linkshell 1
"/rcmode l"

> Sets RaidCalls to Linkshell 1 chat mode.

## Linkshell 2
"/rcmode l2"

> Sets RaidCalls to Linkshell 2 chat mode.

## Tell Mode
"/rcmode t PlayerName"

> Sends all RaidCalls messages directly to the specified player.

Example:
"/rcmode t Toogood"

## Party + Tell Mode
"/rcmode pt PlayerName"

> Sends all RaidCalls messages to both Party chat and the specified player.

Example:
"/rcmode pt Toogood"

# Included Callouts

## Main
* Start DPS
* Hold DPS
* Focus Add
* Focus Boss
* Stun #1
* Stun #2

## Dynamis
* Ninja Warning
* Hold TP
* Perfect Dodge
* Invincible
* Slimes Need Silence
* White Mage Warning

## Hold Percentages

### 20% Holds
* Hold at 80%
* Hold at 60%
* Hold at 40%
* Hold at 20%

### 25% Holds
* Hold at 75%
* Hold at 50%
* Hold at 25%

# Example Output
* START DPS
* HOLD DPS
* FOCUS ADD
* STUN #1 GO!
* PERFECT DODGE - BLM PICK OFF MOBS
* SLIMES NEED SILENCE

# Notes
RaidCalls does not automate gameplay in any way.

The addon only:
* displays UI buttons
* sends chat messages
* assists with raid communication

No combat automation, targeting, movement, packet interaction, or unattended gameplay functionality is included.

# Author
Toogood @ Horizon
```
