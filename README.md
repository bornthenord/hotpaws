# Keyborg

![](https://github.com/bornthenord/keyborg/blob/main/logo.png)

## Quick key remapping for macOS

# How use
Capslock - enable/disable\
or\
press 'fn'

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

## Tips and tricks
Swap the Caps Lock and Fn keys (Settings -> Keyboard -> Shortcuts -> Modifier Keys).\
Now, while holding Caps Lock, you can easily switch between "layers" as needed.
