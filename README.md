<p align="center">
  <img width="256" height="256" src="https://github.com/bornthenord/keyborg/blob/main/logo.jpeg">
<p>
<h1 align="center">Hot swap key mapping for macOS</h1>

## Pre requirements
Version macOS Big Sur 11.5 or higher

## Installation
1. Download dmg [installer](https://github.com/bornthenord/keyborg/releases)
2. Open the installer and copy the app to the Applications folder
3. When you first start it, you need to grant access to Accessibility, and then restart the application

## How use
Remapping will be enabled while **[switch key]** is held down

### Configuration
The configuration consists of **[switch key]**

- **[switch key]** - toggle key, required

mapping rule **key source**:**keys target**:**modifiers** for switch key

- **key source** - the key to be redefined, required
- **keys target** - keys (separated by commas) to which we assign, required
- **modifiers** - modifiers (separated by commas) to be pressed, not required

and comment **#**

### Example

```text
# cmd layer
[cmd]
# like vim navigation
h:left
k:up
j:down
l:right

# cmdr layer
[cmdr]
l:enter
k:escape
```