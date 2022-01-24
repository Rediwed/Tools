# Tools

Repository containing various code snippets and tools that I often use.

# GP Manager
GP Manager is a AppleScript tool that automates the opening and quitting of persistent Palo Alto Global Protect VPN software. By default, Global Protect can’t really be ‘quit’ unless you unload its KEXT files and quit it from the activity monitor.

This tool detects whether GP is running, and then proposes to either launch or quit Palo Alto’s service.

# Binary Addition
Python script that adds two binary numbers of any length, without using built-in functions for binary addition.

# Applescript Raycast commands for Philips Hue
Contains a set of three applescripts that can be added as command in Raycast. This allows you to quickly turn off, turn on, or toggle your Philips Hue lights. The script assumes you have a Philips Hue bridge deployed on your network. Furthermore, you need to be registered as a developer on your Philips Bridge. To register on your bridge, use the following instructions: https://developers.meethue.com/develop/get-started-2/

Note that the light ID's are hardcoded in this script. The beginning of the script contains a list of lights that you want to be included for the command run. You can get the ID's of each light by running GET on url '/api/[your API key]/lights' through CLIP API Debugger (http://[Bridge IP-address]/debug/clip.html
