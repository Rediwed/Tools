#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Hue on
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🚦

# Documentation:
# @raycast.description Turns all hue lights on
# @raycast.author Rediwed

set lights to {4, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17} as list -- List of lights you want to turn on

Change(lights) -- initates script

on GetBridge()
	return "[enter bridge IP here]" -- The Bridge IP
end GetBridge

on GetApi()
	return "[enter API key here]" -- Your ApiKey
end GetApi

on GetOn()
	set ret to the quoted form of "{\"on\": true,\"hue\": 0, \"sat\": 0,\"bri\": 254}"
	return ret
end GetOn

on Change(x)
	repeat with x in x
		set BridgeAddress to GetBridge()
		set apiKey to GetApi()
		
		turnOn(x)
	end repeat
end Change

on turnOn(x)
	set BridgeAddress to GetBridge()
	set apiKey to GetApi()
	set action to GetOn()
	
	do shell script "curl --request PUT --data " & action & " http://" & BridgeAddress & "/api/" & apiKey & "/lights/" & x & "/state/"
	log "Lights Turned on"
end turnOn



