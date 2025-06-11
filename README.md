<p align="center">
  <img width="256" height="256" src="https://github.com/bornthenord/keyborg/blob/main/logo.jpeg">
<p>
<h1 align="center">Hot Swap Key Mapping for macOS</h1>

## What is?
This is a utility that allows you to dynamically remap keys or assign keyboard shortcuts on macOS.

## Installation
1. Download dmg [installer](https://github.com/bornthenord/hotpaws/releases)
2. Open the downloaded file and copy the app to the **Applications** folder.
3. When you first launch the app, you need to grant Accessibility permissions:
   - Go to ***System Preferences*** > ***Security & Privacy*** > ***Accessibility***.
   - Allow access for the application.
   - Restart the app afterward.

*Requirements: macOS Big Sur 11.5 or higher.*

## How use
Remapping will be active while holding down the **[switch key]**, or if configured in the **[general]** section.

### Configuration
The configuration consists of

- **[general]** - rules that work without modifier keys.
- **[switch key]** - the modifier key used to activate remapping (e.g., a specific key code).
- **key**:**targets**:**modifiers** - remapping rules:
    - **key** - the key code to be remapped (required).
    - **targets** - comma-separated target key codes (required).
    - **modifiers** - optional comma-separated modifier codes.
- **Comments**: lines starting with #.

You can assign rules based on modifier keys such as Caps Lock, Shift, Right Shift, Function, Control, Option, Right Option, Command, and Right Command.

To find out the code for a specific key or modifier, use the code definition feature in the app's settings.

### Examples

```ini
# Mapping without modifiers
[general]
# Lock screen with F1 key
f1:q:ctrl,cmd

# Vim-like navigation when Command is pressed
[cmd]
h:left
k:up
j:down
l:right

# When Option is pressed
[opt]
h:left:opt,cmd
l:right:opt,cmdl:right:opt,cmd
```
