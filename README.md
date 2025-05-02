# Keyborg

![](https://github.com/bornthenord/keyborg/blob/main/logo.png)


## Remap Mac Keys, Boost Productivity!
The next time I moved my hand to the arrow keys on my keyboard to find another file, I realized that this couldn't go on. 

# How use
Capslock - enable/disable\
or\
press 'fn' for sticky layer

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
