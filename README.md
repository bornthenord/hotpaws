<p align="center">
  <img width="256" height="256" src="https://github.com/bornthenord/keyborg/blob/main/logo.jpeg">
<p>
<h1 align="center">Hot swap key mapping for macOS</h1>

## What is?
This is a utility that allows you to redefine keys or assign a keyboard shortcut.

## Installation
1. Download dmg [installer](https://github.com/bornthenord/hotpaws/releases)
2. Open the installer and copy the app to the Applications folder
3. When you first start it, you need to grant access to Accessibility, and then restart the application

*Requirements: Version macOS Big Sur 11.5 or higher*

## How use
Remapping will be enabled while the **[switch key]** is held down or if the **[general]** section is configured.

### Configuration
The configuration consists of

- **[general]** - the mapping specified in the general section works without modification keys
- **[switch key]** - modifier code
- **key**:**targets**:**modifiers** - mapping rule
    - **key** - key code to be redefined, required
    - **targets** - key codes (separated by commas) to which we assign, required
    - **modifiers** - modifier codes (separated by commas) to be pressed, not required
- **#** - comment

You can assign rules to key modifiers: caps lock/shift/right shift/function/control/option/right option/command and right command.\
To determine the code for the desired key or modifier, use the code definition feature in the settings.

### Examples

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

# mapping if opt key pressed
[opt]
# left tab
h:left:opt,cmd
# right tab
l:right:opt,cmd
```
