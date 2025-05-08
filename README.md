<p align="center">
  <img width="256" height="256" src="https://github.com/bornthenord/keyborg/blob/main/logo.png">
<p>
<h1 align="center">On the fly key remapping for macOS</h1>

## Installation
1. Download dmg [installer](https://github.com/bornthenord/keyborg/releases)
2. Open the installer and copy the app to the Applications folder
3. When you first start it, you need to grant access to Accessibility, and then restart the application

## How use
<b>caps lock</b> - enable/disable\
or press <b>fn</b> for remapping will be enabled while the button is held down

### Configuration

The configuration consists of mapping rules [***key source***]:[***keys target***]:[***modifiers***] and comments ***#***

[***key source***] - the [key](https://github.com/bornthenord/keyborg/blob/main/src/Keyborg/Keyborg/Keyboard/Keys/Key.swift) to be redefined\
[***keys target***] - [keys](https://github.com/bornthenord/keyborg/blob/main/src/Keyborg/Keyborg/Keyboard/Keys/Key.swift) (separated by commas) to which we assign\
[***modifiers***] - [modifier](https://github.com/bornthenord/keyborg/blob/main/src/Keyborg/Keyborg/Keyboard/Keys/Modifier.swift) (separated by commas) to be pressed, not required

### Example

\# like vim navigation\
h:left\
k:up\
j:down\
l:right\
\# next tab\
s:left:option,command

## Tips & Tricks
Swap the Caps Lock and Fn keys (Settings -> Keyboard -> Shortcuts -> Modifier Keys).\
Now, by holding down the Caps Lock key with your pinky, you can easily switch between "layers" as needed.
