# Keyborg

![](https://github.com/bornthenord/keyborg/blob/main/logo.png)

## Quick key remapping for macOS

# Installation
1. Download dmg [installer](https://github.com/bornthenord/keyborg/releases)
2. Open the installer and copy the app to the Applications folder
3. When you first start it, you need to grant access to Accessibility, and then restart the application

# How use
Capslock - enable/disable\
or\
press 'fn' (remapping will be enabled while the button is held down)

## Configuration

The configuration consists of mapping rules ([key source]:[keys targets]:[modifier keys]) and comments (#)

[key source] - the key to be redefined\
[keys targets] - keys (separated by commas) to which we assign\
[modifier keys] - modifier keys (separated by commas) to be pressed, not required

[Key/modifier naming](https://github.com/bornthenord/keyborg/blob/main/src/Keyborg/Keyborg/Keyboard/Key.swift)
## Example

\# like vim navigation\
h:left\
k:up\
j:down\
l:right\
\# next tab\
s:left:option,command

# Tips & Tricks
Swap the Caps Lock and Fn keys (Settings -> Keyboard -> Shortcuts -> Modifier Keys).\
Now, by holding down the Caps Lock key with your pinky, you can easily switch between "layers" as needed.
