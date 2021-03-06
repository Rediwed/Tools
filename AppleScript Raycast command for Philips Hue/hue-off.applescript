#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Hue off
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🚥

# Documentation:
# @raycast.description Turns all Hue lights off
# @raycast.author Rediwed

set lights to {4, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17} as list -- List of lights you want to turn off

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

on GetOff()
	set ret to the quoted form of "{\"on\": false}"
	return ret
end GetOff

on Change(x)
	repeat with x in x
		set BridgeAddress to GetBridge()
		set apiKey to GetApi()
		
		turnOff(x)
	end repeat
end Change

on turnOff(x)
	set BridgeAddress to GetBridge()
	set apiKey to GetApi()
	set action to GetOff()
	
	do shell script "curl --request PUT --data " & action & " http://" & BridgeAddress & "/api/" & apiKey & "/lights/" & x & "/state/"
	log "Lights Turned off"
end turnOff


