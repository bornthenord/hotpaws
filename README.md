<p align="center">
  <img width="256" height="256" src="https://github.com/bornthenord/keyborg/blob/main/logo.jpeg">
<p>
<h1 align="center">Hot swap key mapping for macOS</h1>

## Pre requirements
Version macOS Big Sur 11.5 or higher

## Installation
1. Download zip [arhive](https://github.com/bornthenord/hotpaws/releases)
2. Open the archive and extract the app to the Applications folder
3. When you first start it, you need to grant access to Accessibility, and then restart the application

## How use
Remapping will be enabled while the **[switch key]** is held down or if the **[general]** section is configured.

### Configuration
The configuration consists of **[switch key]**

- **[switch key]** - modifier code, required

mapping rule **key**:**targets**:**modifiers** for switch key

- **key** - key code to be redefined, required
- **targets** - key codes (separated by commas) to which we assign, required
- **modifiers** - modifier codes (separated by commas) to be pressed, not required

- **[general]** - the mapping specified in the general section works without modification keys

and comment **#**

You can assign rules to modifiers: caps lock/shift/right shift/function/control/option/right option/command and right command\
To determine the code for the desired key or modifier, use the code definition feature in the settings.

### Example

```text
# mapping without modification keys
[general]
# lock screen
grave:q:ctrl,cmd

# mapping if command key pressed
[cmd]
# like vim navigation
h:left
k:up
j:down
l:right

# mapping if right command key pressed
[cmdr]
l:enter
k:escape
```
