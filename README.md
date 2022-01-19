# Tools

Repository containing various code snippets and tools that I often use.

#GP Manager
GP Manager is a AppleScript tool that automates the opening and quitting of persistent Palo Alto Global Protect VPN software. By default, Global Protect can’t really be ‘quit’ unless you unload its KEXT files and quit it from the activity monitor.

This tool detects whether GP is running, and then proposes to either launch or quit Palo Alto’s service.

