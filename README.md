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
If you hold down the spacebar, the replacement keys specified in the configuration will be activated.

### Configuration

The configuration consists of mapping rules [***key source***]:[***keys target***]:[***modifiers***] and comments ***#***

[***key source***] - the key to be redefined\
[***keys target***] - keys (separated by commas) to which we assign\
[***modifiers***] - modifiers (separated by commas) to be pressed, not required

*To determine the code of the desired key, you need to use the key definition function in the settings.*

### Example

\# like vim navigation\
h:left\
k:up\
j:down\
l:right\
\# tab navigation\
s:left:option,command\
d:right:option,command